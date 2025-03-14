#!/usr/bin/bash

helm install loki grafana/loki-stack --namespace monitoring --set promtail.enabled=true
kubectl apply -f loki/svc.yaml