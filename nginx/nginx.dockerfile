FROM nginx:1.12.2
COPY conf.d	/etc/nginx/conf.d
COPY cert 	/etc/nginx/cert
