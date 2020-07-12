# Downloads and uses openjdk-8 image
FROM openjdk:8-jdk-alpine
# tell docker what port to expose
EXPOSE 8085
# Add the jar file ot the image
COPY /target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar

CMD ["java","-jar","/home/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar"]