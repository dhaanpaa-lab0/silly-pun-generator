all: 
reset:
	kubectl delete -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.15/kubegres.yaml
clean:
	kubectl delete -f ./kubernetes/kubegres
kubegresinstall:
	kubectl apply -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.15/kubegres.yaml
kubegressetuplogin:
	./scripts/create-postgres-login
kubegressetupdatabase: kubegressetuplogin
	kubectl apply -f ./kubernetes/kubegres/postgres-db.yaml
dbclientinstall:
	./scripts/dbclient-create
dbclientuninstall:
	./scripts/dbclient-remove
dbclientlogin:
	./scripts/dbclient-login