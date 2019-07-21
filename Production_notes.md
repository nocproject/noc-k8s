# Current state of project is not production ready.


# Todos

* consul!!!
* ~~external dbs~~
* ~~logging~~
* ~~internal monitoring~~
** ~~prometheus operator~~
** ~~grafana~~
** dashboards
* ~~error reporting (sentry)~~
    * url. should be tested how to work with new sentry
* ~~transit encryption ??~~  costs too much. 
** ~~istio ???~~  costs too much.
* password generation 
** eliminate default passwords
* ~~helm/kapitan/kustomize~~ helm.
* direct access to clickhouse / chproxy
* ~~proxy support ?~~ out of scope 

# principle scheme of web interface

render me on https://mermaidjs.github.io/mermaid-live-editor/
```
graph LR
User -->|web gui| LoadBalancer
subgraph monitoring
    User --> mon.srv
    mon.srv --> grafana
    grafana --> prometheus
    mon.srv --> sentry 
    mon.srv --> consul-ui
end
subgraph Web interface
    LoadBalancer --> Ingress
    Ingress --> static_nginx
    Ingress --> front_nginx
    front_nginx --> noc_web_svc
end

subgraph get data
    activator --> switch
    discovery --> activator
end

```
