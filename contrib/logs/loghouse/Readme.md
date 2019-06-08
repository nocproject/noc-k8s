# install
```
helm repo add loghouse https://flant.github.io/loghouse/charts/
helm repo update
helm upgrade --install log loghouse/loghouse --atomic --namespace logging --values values.yaml
```


# broken. multiple times. do not use it
