docker run --name nginx -v /var/log/nginx:/var/log/nginx \
        -p 80:80 \
        -it -d nginx:$version
