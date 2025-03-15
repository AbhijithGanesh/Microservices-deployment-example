#!/usr/bin/env bash
set -euo pipefail

# Redirect all output to install/logs.txt
exec > install/logs.txt 2>&1

STEP=1
TOTAL_START=$(date +%s)

function step_echo() {
    echo "Step ${STEP}: $1"
    ((STEP++))
}

function run_and_time() {
    local description="$1"
    shift
    step_echo "${description}"
    local start=$(date +%s)
    "$@"
    local end=$(date +%s)
    local duration=$((end - start))
    echo "Duration: ${duration} seconds"
    echo "--------------------------------------"
}

run_and_time "Cleaning old minikube" minikube delete

run_and_time "Starting Minikube..." minikube start

kubectl create secret generic postgres-secret \
  --from-literal=password=postgres

run_and_time "Enabling Ingress addon..." minikube addons enable ingress

run_and_time "Enabling Metrics Server addon..." minikube addons enable metrics-server

run_and_time "Deploying Istio..." ./scripts/istio.sh

run_and_time "Deploying Cilium..." ./cillium/cillium.sh

run_and_time "Creating monitoring namespace..." kubectl create namespace monitoring

run_and_time "Adding ghcr secret..." ./tmp/ghcr-token.sh

run_and_time "Packaging Helm chart: xnl-innovations-hiring-challenge..." helm package helm/

run_and_time "Installing Helm chart: xnl-innovations-hiring-challenge..." bash -c 'kubectl delete sidecars.networking.istio.io adservice --namespace default --ignore-not-found && helm install xnl-v1 xnl-innovations-hiring-challenge-0.1.0.tgz -f values.yaml > logs/install.log'

run_and_time "Installing Helm chart: prometheus-community..." ./scripts/installgpf.sh

run_and_time "Installing databases: Clickhouse and Postgres..." ./scripts/installdb.sh

TOTAL_END=$(date +%s)
TOTAL_DURATION=$((TOTAL_END - TOTAL_START))
echo "All steps completed successfully in ${TOTAL_DURATION} seconds!"