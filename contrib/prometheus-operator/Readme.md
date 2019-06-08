# install

apply with 
```
helm upgrade --install mon stable/prometheus-operator --atomic --namespace monitoring --values values.yaml
```

probably you shave to change
```
kubectl get prometheuses.monitoring.coreos.com -n monitoring -o yaml
```
and remove 
```yaml
    serviceMonitorSelector:
      matchLabels:
        release: mon
```
to become 
```yaml
    serviceMonitorSelector: {}
```
