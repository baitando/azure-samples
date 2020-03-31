FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG EXPLODED=target/exploded
COPY ${EXPLODED}/BOOT-INF/lib /app/lib
COPY ${EXPLODED}/META-INF /app/META-INF
COPY ${EXPLODED}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","de.baitando.azure.samples.springfunction.SpringDeployApplication"]