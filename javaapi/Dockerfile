FROM maven:3.9-eclipse-temurin-8 AS build_image
WORKDIR /app
COPY . .
RUN  mvn install -DskipTests

FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=build_image /app/target/book-work-0.0.1-SNAPSHOT.jar ./book-work-0.0.1.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "book-work-0.0.1.jar"]
