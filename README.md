
# Kubernetes Database Setup for digital ocean kubernetes cluster
## Challenge: `Setup a scalable postgres database cluster`

***Warning:*** This is probably very insecure by default

***Note:*** This assumes you have installed doctl cli from digitial ocean

***Note:*** All of this assumes that you have a working kubernetes cluster that you can use to experiments with this

## Installation:

1.Create Kubernetes cluster in digital ocean
```
ID                                      Name                                  Region    Version        Auto Upgrade    Status     Node Pools
f8cb4655-e949-4b89-8d74-b3208e4a2437    k8s-1-21-5-do-0-nyc3-1640406587689    nyc3      1.21.5-do.0    false           running    pool-f0aep6r4q
```
1a.Run `make dokskubeconfig` to add your cluster to your local kubeconfig

Example Output:
```
./scripts/doctl-save-kubeconfig
ID                                      Name                                  Region    Version        Auto Upgrade    Status     Node Pools
f8cb4655-e949-4b89-8d74-b3208e4a2437    k8s-1-21-5-do-0-nyc3-1640406587689    nyc3      1.21.5-do.0    false           running    pool-f0aep6r4q
Enter Kubernetes Cluster Id ... f8cb4655-e949-4b89-8d74-b3208e4a2437
Notice: Adding cluster credentials to kubeconfig file found in "/home/denadmin/.kube/config"
Notice: Setting current-context to do-nyc3-k8s-1-21-5-do-0-nyc3-1640406587689
```

2.Run `make kubegresinstall` and then wait until pods are in ready state

3.Run `make kubegressetupdatabase` and then wait until pods are in ready state

Example Output from steps 2-3:
```
NAME               READY   STATUS    RESTARTS   AGE
pod/clu-psql-1-0   1/1     Running   0          6d
pod/clu-psql-2-0   1/1     Running   0          6d
pod/pg-client      1/1     Running   0          6d

NAME                       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)    AGE
service/clu-psql           ClusterIP   None         <none>        5432/TCP   6d
service/clu-psql-replica   ClusterIP   None         <none>        5432/TCP   6d
service/kubernetes         ClusterIP   10.245.0.1   <none>        443/TCP    6d

NAME                          READY   AGE
statefulset.apps/clu-psql-1   1/1     6d
statefulset.apps/clu-psql-2   1/1     6d
```

4.(optional) Run `make dbclientinstall` to create a pod for connecting to database

5.Once pg-client pod is up Run `make dbclientlogin`

6.When Finished with pg-client run `make dbclientuninstall`

## Scripts

| Script Name | Description |
| ----------- | ------------ |
| scripts/create-postgres-login | Used by Makefile to create database login |
| scripts/dbclient-create | Creates pod for database maintenance |
| scripts/dbclient-login | Opens psql for running against client pod |
| scripts/dbclient-copy-files | Copy files to `pg-client` pod for usage in pod |
| scripts/dbclient-create-dir | Creates directory in pod `pg-client` |
| scripts/dbclient-remove | Deletes client pod |
| scripts/dbserver-install | Installs Database Server (Kubegres) |
| scripts/dbserver-uninstall | Uninstalls Database Server (Kubegres) from cluster |
| scripts/doctl-get-kubeclusters | Get Currently Setup Digital Ocean Kube Clusters |
| scripts/doctl-save-kubeconfig | Save Kubernetes Config from Digital Ocean Kube Cluster |
