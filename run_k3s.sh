#!/bin/sh

# install local-path provisioner

kubectl apply -f env/k3s/volumes

kubectl get storageclass

kubectl apply -f env/k3s/metrics_server_k3s/
