#!/usr/bin/env bash
set -e

# Check if the Cilium release "cilium-v1" is already installed in the kube-system namespace.
if helm status cilium-v1 -n kube-system > /dev/null 2>&1; then
  echo "Cilium is already installed, skipping installation."
else
  echo "Installing Cilium..."
  helm repo add cilium https://helm.cilium.io/ || true
  helm repo update
  helm install cilium-v1 cilium/cilium --version 1.12.0 --namespace kube-system
fi
