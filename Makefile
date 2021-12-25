all: dev
clean:
	./mvnw clean
dev:
	./mvnw compile quarkus:dev
package: clean
	./mvnw package
packageuber: clean
	./mvnw package -Dquarkus.package.type=uber-jar
packagenative: clean
	./mvnw package -Pnative
kubegresinstall:
	kubectl apply -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.15/kubegres.yaml
kubegressetuplogin:
	kubectl apply -f ./kubernetes/kubegres/postgres-login.yaml
kubegressetupdatabase: kubegressetuplogin
	kubectl apply -f ./kubernetes/kubegres/postgres-db.yaml
