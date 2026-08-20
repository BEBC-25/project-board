# 컨테이너가 구동중일 경우 삭제 후 다시 구동
docker stop mydb
docker stop board-web

docker rm mydb
docker rm board-web

# MySql DB 컨테이너 구동
docker run -d --name mydb --network my-net -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql:9.7

# temurin 25 jre 컨테이너 구동
docker run -d --name board-web -p 80:8080 --network my-net eclipse-temurin:25-jre-alpine tail -f //dev/null

# 로컬의 빌드된 최종 코드를 컨테이너에 복사(로그인한 계정의 홈디렉토리로 복사)
docker cp ./build/libs/spring-board-0.0.1-SNAPSHOT.jar board-web:/root/board.jar

# 컨테이너 내부의 대화형 쉘 접속 후 java 명령어로 board.jar 실행
docker exec -it board-web //bin/sh
cd ~
java -jar board.jar


