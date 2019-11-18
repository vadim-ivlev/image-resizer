FROM nginx

RUN apt-get -y update && apt-get -y install fish mc vim htop

#COPY configs  /app/configs
#EXPOSE 80
#CMD bash -c "cd /app && ./image-resizer -serve 7700 -env=docker"




