# xauth list   // then copy the following coockie: <username>/unix:  MIT-MAGIC-COOKIE-1  f1fa006c1e51fa8386209f85c57947c4
# docker build -t <image-name> .
# docker run -it --net=host -e DISPLAY -v /tmp/.X11-unix guitest bash  // into machice run
#$ xauth add <cookie>  // to add cookie
#$ xauth list   // to verify
#$ firefox // to run firefox into localmachine

FROM ubuntu:20.04

VOLUME /etc/localtime

RUN apt-get -y update && \
    apt-get -y install nginx

RUN adduser --system --group admin --shell /bin/sh

USER admin

WORKDIR /home/admin/app

EXPOSE 80
EXPOSE 443
#CMD ["python3", "tk.py"] 
