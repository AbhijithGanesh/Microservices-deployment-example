#!/usr/bin/bash

helm repo add cilium https://helm.cilium.io/
helm repo update
helm install cilium-v1 cilium/cilium --version 1.12.0 --namespace kube-system
kubectl -n kube-system get pods -l k8s-app=cilium
