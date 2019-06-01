Noc deployment via k8s
======================

In extremely early stage
------------------------

read `run.sh` for more details.

run_yandex sholud init yandex kubernetes if you already has one. 


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
