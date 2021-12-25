# Kubernetes Setup
#### Cluster Setup:
1. Goto the root source directory for the project
2. type in `make kubgressinstall` this assumes that your KUBECONFIG env var is setup properly
3. You will need to edit the `./kubernetes/kubegres/postgres-login.yaml` file with the credentials you want to use
4. type in `make kubgres`