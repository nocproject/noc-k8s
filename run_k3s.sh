#!/bin/sh

# install local-path provisioner

kubectl apply -f env/k3s/

kubectl get storageclass
