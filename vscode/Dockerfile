# xauth list   // then copy the following coockie: <username>/unix:  MIT-MAGIC-COOKIE-1  f1fa006c1e51fa8386209f85c57947c4
# docker build -t <image-name> .
# docker run -it --net=host -e DISPLAY -v /tmp/.X11-unix guitest bash  // into machice run
#$ xauth add <cookie>  // to add cookie
#$ xauth list   // to verify
#$ firefox // to run firefox into localmachine

FROM alpine:3.15

ENV AUTH "mani/unix:0  MIT-MAGIC-COOKIE-1  a83e0e59bd65bca63ac7934182741588"

ENV GID 1001
ENV UID 1000

ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

RUN apk add --no-cache bash xauth tzdata mousepad

RUN addgroup -S swali -g $GID && \
    adduser -S admin -u $UID -G swali -s /bin/bash

RUN ln -sf /usr/share/zoneinfo/Canada/Eastern /etc/localtime

USER admin

RUN touch /home/admin/.Xauthority && xauth add $AUTH

WORKDIR /home/admin

EXPOSE 8887
# CMD ["python3", "tk.py"] 
