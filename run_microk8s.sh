#!/bin/sh

# where 608 is taken from df | grep microk8s
microk8s.config > privs/microk8s/config
export KUBECONFIG=$PWD/privs/microk8s/config

# enable storage
# data willbe avalaible in /var/snap/microk8s/common/default-storage
microk8s.enable storage

# enable ingress
# its dump.
microk8s.enable ingress
kubectl apply -f overlays/microk8s/loadbalancer.yaml
kubectl apply -f overlays/microk8s/nginx-ds.yaml

# enable metallb
kubectl apply -f contrib/metallb/metallb.yaml

# configure ips and create configmap
kubectl apply -f contrib/metallb/metallb-configmap.yaml

# enable dns
microk8s.enable dns

# enable psp
# sudo vi /var/snap/microk8s/current/args/kube-apiserver
# add PodSecurityPolicy to --enable-admission-plugins
# restart with
# microk8s.stop ; microk8s.start
# from https://github.com/intelygenz/lab-microk8s-pod-security-policies/blob/master/6.Enable-Pod-Security-Policy.md
