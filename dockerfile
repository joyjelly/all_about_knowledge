# 빌드 스테이지
FROM maven:3.8.4-openjdk-11 as build 
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 실행 스테이지
FROM openjdk:11
FROM tomcat:9.0
# target경로의 WAR파일 경로를 적어준다.(확인!)
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/aak-1.0.0-BUILD-SNAPSHOT.war ./app.war

EXPOSE 8080
#ENTRYPOINT ["java","-jar","/app.war"]
#CMD [ "catalina.sh","run" ]
CMD ["tail", "-f", "/dev/null"]