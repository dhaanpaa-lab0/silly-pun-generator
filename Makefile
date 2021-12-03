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
