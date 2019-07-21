#!/bin/sh

# auth info
export KUBECONFIG=$PWD/privs/config

set -xe

# install and init tiller
kubectl apply -f tiller.yaml
helm init --service-account tiller --history-max 1 --upgrade

# install noc
helm upgrade --install --wait --atomic noc noc/

# go and get your oun tls cert fir ingress https://kubernetes.io/docs/concepts/services-networking/ingress/#tls
#kubectl apply -f ./noc/templates/configs/tls-secret.yaml
