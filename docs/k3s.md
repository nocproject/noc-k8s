K3s specific notes
==================

fisrt of all you need a volume.

`run_k3s.sh` will do it for you. 

* to enable metrics server you have to patch 
`/etc/systemd/system/k3s.service`
and add 
```
ExecStart=/usr/local/bin/k3s server --kubelet-arg="address=0.0.0.0"
```
to the end of ExecStart
 `--kubelet-arg="address=0.0.0.0"` 

