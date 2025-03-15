#!/usr/bin/env bash
set -euo pipefail

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

echo "Creating Monitoring workspace"
kubectl get ns monitoring || kubectl create ns monitoring

./prometheus/install.sh && \
./grafana/install.sh && \
./loki/install.sh

