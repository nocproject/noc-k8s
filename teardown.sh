#!/bin/sh

kubectl delete -f noc/

kubectl delete -f system/nsq
kubectl delete pvc datadir-nsq-nsqd-0

kubectl delete -f system/clickhouse

kubectl apply -f system/metrics_server_k3s/

helm delete --purge mongo
helm delete --purge postgres
