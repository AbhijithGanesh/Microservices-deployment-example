#!/usr/bin/env bash
set -euo pipefail

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

echo "Creating Monitoring workspace"
kubectl create ns monitoring

./prometheus/install.sh && \
./grafana/install.sh && \
./loki/install.sh

echo "Port forwarding Grafana to localhost:3000..."
kubectl port-forward -n monitoring svc/grafana 3000:80 &

echo "Port forwarding Loki to localhost:3100..."
kubectl port-forward -n monitoring svc/loki 3100:80 &

echo "Port forwarding Prometheus to localhost:3200..."
kubectl port-forward -n monitoring svc/prometheus-server 3200:80 &

wait
