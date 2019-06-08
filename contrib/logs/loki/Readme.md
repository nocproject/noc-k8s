# install 
```
helm repo add loki https://grafana.github.io/loki/charts
helm repo update
```

# place loki and promtail
```
rhelm upgrade --install log loki/loki-stack  --atomic --namespace logging --values promtail.yaml --values loki.yaml 

```

add http://log-loki.logging:3100 as grafana datasource
