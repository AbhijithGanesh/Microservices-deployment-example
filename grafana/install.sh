#!/bin/bash

helm install grafana grafana/grafana --namespace monitoring
kubectl apply -f grafana/svc.yaml