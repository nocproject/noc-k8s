# install 
```
helm repo add loki https://grafana.github.io/loki/charts
helm repo update
```

# create pvc for loki
```

```

# place loki and promtail
```
helm upgrade --install log loki/loki-stack  --atomic --namespace logging --values promtail.yaml --values loki.yaml 

```

add http://log-loki.logging:3100 as grafana datasource
