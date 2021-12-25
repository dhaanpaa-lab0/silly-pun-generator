
# Kubernetes Database Setup

***Warning:*** This is probably very insecure by default

All of this assumes that you have a working kubernetes cluster that you can use to experiments with this

## Installation:

1.Create Kubernetes cluster

2.Run `make kubegresinstall` and then wait until pods are in ready state

3.Run `make kubegressetupdatabase` and then wait until pods are in ready state

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
| scripts/dbclient-remove | Deletes client |