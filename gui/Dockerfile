# xauth list   // then copy the following coockie: <username>/unix:  MIT-MAGIC-COOKIE-1  f1fa006c1e51fa8386209f85c57947c4
# docker build -t <image-name> .
# docker run -it --net=host -e DISPLAY -v /tmp/.X11-unix guitest bash  // into machice run
#$ xauth add <cookie>  // to add cookie
#$ xauth list   // to verify
#$ firefox // to run firefox into localmachine

FROM ubuntu:22.04

ENV AUTH "mani/unix:0  MIT-MAGIC-COOKIE-1  446235f71c567154f123c4dd8b5a8606"
VOLUME /etc/localtime

RUN apt-get -y update && \
    apt-get -y install xauth \
    python3-pip

RUN adduser --system --group admin --shell /bin/sh

USER admin

RUN touch /home/admin/.Xauthority && xauth add $AUTH

COPY --chown=admin:admin . home/admin/app
WORKDIR /home/admin/app

EXPOSE 8887
#CMD ["python3", "tk.py"] 
