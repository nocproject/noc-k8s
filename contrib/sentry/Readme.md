Run error collecting tools

# install sentry with

edit values.yaml to fit your needs.
than install it with

```helm upgrade --install sentry --atomic --wait stable/sentry --values values.yaml```

# enable error reporting from noc to it with
 

1. open sentry on configured url and create project for noc
default 
username: admin@sentry.local
password can be revealed with command
```
kubectl get secret --namespace default sentry-sentry -o jsonpath="{.data.user-password}" | base64 --decode
```
sentry ip can be revealed with
```
kubectl get svc --namespace default sentry-sentry -o jsonpath='{.status.loadBalancer.ingress[0].ip}'

``` 
and port
```
kubectl get svc --namespace default sentry-sentry -o jsonpath='{.spec.ports[0].nodePort}'
```
login with http://IP:port

[img/create_project.png](img/create_project.png)

Get DSN. https://docs.sentry.io/error-reporting/configuration/?platform=python 
in my case it was `0c9db1b2189d47898b64acc7f94d9020`

1. than update noc config to use configured sentry 
```kubectl patch configmaps noc-configmap -p '{"data":{"NOC_FEATURES_SENTRY":"True"}}'```

place dsn key to 
```kubectl patch configmaps noc-configmap -p '{"data":{"NOC_SENTRY_URL":"http://0c9db1b218:9d47898b64acc7f94d9020@sentry-sentry:9000/2"}}'```

and restart noc. 
