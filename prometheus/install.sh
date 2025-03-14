#/bin/bash

helm install prometheus prometheus-community/prometheus --namespace monitoring
kubectl apply -f prometheus/svc.yaml