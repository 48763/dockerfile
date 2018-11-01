DOCKER_CONTAINER_HASH=$(docker ps -a -f "name=nginx" -q)

docker stop $DOCKER_CONTAINER_HASH
docker rm $DOCKER_CONTAINER_HASH

docker run --name nginx -v /var/log/nginx:/var/log/nginx \
        -p 80:80 \
        -d lab.yukifans.com/jenkins/nginx:1.0.8
