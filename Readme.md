# Noc deployment via k8s


:warning Alpha quality


# Install 

* Get your kubernetes cluster up and running.
* Get account info for your cluster. place it somewhere. fox example privs/ dir.
 set that config as current.   
```
# auth info
export KUBECONFIG=$PWD/privs/config
```
* Noc relies on label `pool` to deploy some pods to. That label should be set for example with. 
do not use it in production

```
kubectl label nodes --all pool=default --overwrite
```

* set options from `noc/values.yaml` to your `noc/my_values.yaml` 
and than install noc with 
```
helm3 upgrade --install --atomic noc noc --values noc/my_values.yaml --set image.pullPolicy=Always
```

Be aware that now for dev purpose there are noc-k8s.getnoc.com tls secret 
bundled with chart. it will be remove in some time. 
Go and get your oun tls cert for ingress 
https://kubernetes.io/docs/concepts/services-networking/ingress/#tls 
and apply it with 
```
kubectl apply -f ./noc/templates/configs/tls-secret.yaml
```

## WARNING

As for now we are expecting that pvc will have default storage class 
so we do not need to set them manually.

## Scope of current development

for now scope of project reduced to
* provide a way how to launch noc with external dbs. 

