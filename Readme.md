Noc deployment via k8s
======================

In extremely early stage
------------------------

read `run.sh` for more details.

run_yandex sholud init yandex kubernetes if you already has one.
teadown.sh -- should do its best to delete everyting  


WARNING
=======

Security is not our focus on current stage of development. 
We use "noc" for every password in system. 

except web iface. there we use admin:admin

Nsq via helm is not working for now as expected. 

As for now we are expecting that pvc will have default storage class so we do not need to set them manually.

Scope of current development
=============================

for now scope of project reduced to
- run dbs in single server mode without any ha. but persist db data to disks
- run nsqd in single server mode
- no consul. 
- noc restrictions
  - only one pool -- default. routing relies only on host machines. because there no good way to assign 
  - only single discovery and ping process. that is because locks and semaphores relies on consul. but there are no consul


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
