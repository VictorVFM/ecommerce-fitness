FROM openjdk:17-jdk-alpine
EXPOSE 8080
ARG JAR_FILE=target/demo-app-1.0.0.jar
ADD ${JAR_FILE} ecommerce-fitness-0.0.1-SNAPSHOT.jar.jar
ENTRYPOINT ["java","-jar","/ecommerce-fitness-0.0.1-SNAPSHOT.jar.jar"]