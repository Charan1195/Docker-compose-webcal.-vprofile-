FROM ubuntu:22.04 AS builder
WORKDIR /app

RUN apt update && \
    apt install -y openjdk-17-jdk maven git

RUN git clone https://github.com/prudhvisurya996/JavaWebCalculator.git /app
WORKDIR /app
RUN mvn clean package

FROM tomcat:9.0-jdk17
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
