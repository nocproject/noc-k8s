#!/bin/sh

# auth info
export KUBECONFIG=$PWD/privs/config

set -xe

# install and init tiller
kubectl apply -f system/tiller.yaml
helm init --service-account tiller --history-max 1 --upgrade

#init noc configmap and secrets
kubectl apply -f noc/noc-configmap.yaml
kubectl apply -f noc/noc-secret.yaml

# setup service account and priorityclass
kubectl apply -f noc/noc-rbac.yaml
kubectl apply -f noc/priorityclass.yaml

# run nsqd
kubectl apply -f system/nsq/

# run clickhouse
kubectl apply -f system/clickhouse/

# init consul
helm upgrade --install consul --atomic stable/consul --values system/consul/values.yaml

#init dbs
helm upgrade --install postgres stable/postgresql --atomic --values system/postgres/values.yaml --version 0.15
helm upgrade --install mongo stable/mongodb --atomic  --values system/mongo/values.yaml



# go and get your oun tls cert fir ingress https://kubernetes.io/docs/concepts/services-networking/ingress/#tls
kubectl apply -f system/tls-secret.yaml


# init noc
kubectl apply -f system/init-job.yaml
