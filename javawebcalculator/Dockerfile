FROM ubuntu:22.04 AS charan

WORKDIR /app

RUN apt update && \
    apt install -y openjdk-17-jdk maven git

RUN git clone https://github.com/prudhvisurya996/JavaWebCalculator.git /app
WORKDIR /app
RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk17

WORKDIR /usr/local/tomcat

RUN rm -rf webapps/*
COPY --from=charan /app/target/*.war webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
