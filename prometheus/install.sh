#/bin/bash

helm install prometheus prometheus-community/prometheus 
kubectl apply -f prometheus/svc.yaml