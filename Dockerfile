# Etapa 1: build con Maven y Java 21
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

# Copiamos el pom y las fuentes
COPY pom.xml .
COPY src ./src

# Compilamos el jar (sin tests para que sea más rápido)
RUN mvn -q -DskipTests package

# Etapa 2: imagen ligera solo con el jar
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copiamos el jar generado (el único que hay en target)
COPY --from=build /app/target/*.jar app.jar

# Render pone la variable PORT automáticamente
ENV JAVA_OPTS=""

EXPOSE 8761

# Usamos PORT si existe; si no, 8761 (para correr local en Docker)
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar --server.port=${PORT:-8761}"]
