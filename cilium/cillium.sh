#!/usr/bin/bash

kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.12/install/kubernetes/quick-install.yaml
helm repo add cilium https://helm.cilium.io/
helm repo update
helm install cilium cilium/cilium --version 1.12.0 --namespace kube-system
kubectl -n kube-system get pods -l k8s-app=cilium
cilium status
