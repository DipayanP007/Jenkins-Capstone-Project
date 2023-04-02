FROM maven as builder

WORKDIR /opt/servlet

COPY . .

RUN mvn clean package


FROM tomcat

COPY --from=builder /opt/servlet/target/simple-servlet-0.1.war /usr/local/tomcat/webapps/