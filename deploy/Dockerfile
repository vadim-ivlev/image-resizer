FROM nginx

# RUN apt-get -y update && apt-get -y install fish mc

COPY ./configs/image-resizer-nginx.conf /etc/nginx/nginx.conf
COPY ./configs/image-resizer-default.conf /etc/nginx/conf.d/default.conf

