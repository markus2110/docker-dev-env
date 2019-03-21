# Nginx
FROM nginx:1.9-alpine AS nginx

COPY ./conf/prod.conf /etc/nginx/conf.d/prod.conf

EXPOSE 80 443
