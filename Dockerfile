FROM maven:3.9.10-amazoncorretto-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package -X -DskipTests

FROM openjdk-17-jdk-alpine
WORKDIR /app
COPY --from=build ./app/target/*.jar ./loginauthapp.jar
ENTRYPOINT java -jar loginauthapp.jar
