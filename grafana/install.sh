#!/bin/bash

helm install grafana grafana/grafana 
kubectl apply -f grafana/svc.yaml

echo "Grafana password is"
kubectl get secret  grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
