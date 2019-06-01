#!/bin/sh

kubectl delete -f noc/

kubectl delete -f system/nsq
kubectl delete pvc datadir-nsq-nsqd-0

kubectl delete -f system/clickhouse

helm delete --purge mongo 
helm delete --purge postgres
