# xauth list   // then copy the following coockie: <username>/unix:  MIT-MAGIC-COOKIE-1  f1fa006c1e51fa8386209f85c57947c4
# docker build -t <image-name> .
# docker run -it --net=host -e DISPLAY -v /tmp/.X11-unix guitest bash  // into machice run
#$ xauth add <cookie>  // to add cookie
#$ xauth list   // to verify
#$ firefox // to run firefox into localmachine

FROM ubuntu:20.04

ARG X_AUTH
VOLUME /etc/localtime

COPY --chown=root . .
RUN ./install.sh admin

USER admin

RUN touch /home/admin/.Xauthority && xauth add $X_AUTH

WORKDIR /home/admin

#EXPOSE 8887
#CMD ["python3", "tk.py"] 
