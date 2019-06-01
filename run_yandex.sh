#!/bin/sh

yc managed-kubernetes cluster create \
--name test-k8s-cluster \
--network-name default \
--zone ru-central1-c \
--subnet-name default-ru-central1-c \
--public-ip \
--cluster-ipv4-range 10.129.0.0/16 \
--service-ipv4-range 10.128.0.0/16 \
--service-account-name     kubernetes-service-account \
--node-service-account-name kubernetes-service-account


yc managed-kubernetes node-group create \
--name test-nodegroup \
--cluster-name test-k8s-cluster \
--fixed-size 2 \
--location zone=ru-central1-c,subnet-name=default-ru-central1-c \
--public-ip \
--preemptible
