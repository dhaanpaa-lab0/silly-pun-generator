all: 
doksclusters:
	./scripts/doctl-get-kubeclusters
dokskubeconfig:
	./scripts/doctl-save-kubeconfig
reset:
	kubectl delete -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.15/kubegres.yaml
clean:
	./scripts/dbserver-uninstall
kubegresinstall:
	./scripts/dbserver-install
kubegressetupdatabase:
	./scripts/create-postgres-login
	kubectl apply -f ./kubernetes/kubegres/postgres-db.yaml
dbclientinstall:
	./scripts/dbclient-create
dbclientuninstall:
	./scripts/dbclient-remove
dbclientlogin:
	./scripts/dbclient-login