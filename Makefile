all: dev
dev:
	./mvnw compile quarkus:dev
package:
	./mvnw package
packageuber:
	./mvnw package -Dquarkus.package.type=uber-jar
packagenative:
	./mvnw package -Pnative
