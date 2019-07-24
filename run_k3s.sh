#!/bin/sh

# install local-path provisioner

export KUBECONFIG=$PWD/privs/config

kubectl apply -f overlays/k3s/volumes

kubectl get storageclass

# install metric server
kubectl apply -f overlays/k3s/metrics_server_k3s/
