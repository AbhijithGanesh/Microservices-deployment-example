#!/bin/bash

helm install grafana grafana/grafana --namespace monitoring
kubectl apply -f grafana/svc.yaml

echo "Grafana password is"
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
