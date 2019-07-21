#!/bin/sh

kubectl delete -f noc/

kubectl delete -f env/k3s/metrics_server_k3s/

helm delete --purge noc
