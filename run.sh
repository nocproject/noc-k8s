#!/bin/sh

# auth info
export KUBECONFIG=$PWD/privs/config

set -xe

# install and init tiller
kubectl apply -f system/tiller.yaml
helm init --service-account tiller --history-max 1

#init noc configmap and secrets
kubectl apply -f noc/noc-configmap.yaml
kubectl apply -f noc/noc-secret.yaml

# run nsqd
kubectl apply -f system/nsq/

#init dbs
helm upgrade --install postgres stable/postgresql --values system/postgres/values.yaml
helm upgrade --install mongo stable/mongodb --values system/mongo/values.yaml

# go and get your oun tls cert fir ingress https://kubernetes.io/docs/concepts/services-networking/ingress/#tls
kubectl apply -f system/tls-secret.yaml


#init noc
kubectl apply -f noc/db-init-job.yaml ; sleep 30
kubectl apply -f noc/db-sync-perms-job.yaml ; sleep 15
kubectl apply -f noc/db-ensure-indexes-job.yaml ; sleep 10

kubectl apply -f noc/collections-install-job.yaml ; sleep 10
kubectl apply -f noc/sync-mibs-job.yaml 

