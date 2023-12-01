# FROM -> 어떤 가상 환경에서 실행을 할 것인가 선택
# ARG -> 아규먼트 대문자(스네이크) TEST_NAME=test
# CMD -> 도커환경에서 명령어를 실행할 수 있음(1번만 가능)
# COPY -> TEST_NAME aaa (as)
# ENTRYPOINT ["java", "-Dspring.profiles.active=prod1", "-Dserver.env=green", "-jar", "파일명.jar"] -> 띄어쓰기로 합쳐짐 yml의 서버를 바꿀 수 있다

FROM amazoncorretto:11-alpine-jdk
ARG JAR_FILE=target/*.jar
ARG PROFILES
ARG ENV
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILES}", "-Dserver.env=${ENV}", "-jar", "app.jar"]