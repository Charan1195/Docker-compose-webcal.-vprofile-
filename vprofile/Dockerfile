FROM ubuntu:22.04 AS builder
WORKDIR /app
RUN apt update && \
    apt install -y openjdk-17-jdk maven git
RUN git clone https://github.com/anji103/vprofile-project /app
WORKDIR /app
RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
