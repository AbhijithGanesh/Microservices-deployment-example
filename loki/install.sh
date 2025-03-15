#!/usr/bin/bash

helm install loki grafana/loki-stack  --set promtail.enabled=true
kubectl apply -f loki/svc.yaml