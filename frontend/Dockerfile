# RUN AS
#
# docker build -t alcaldia_fr .
# docker run -ti -v .:/home/admin/app alcaldia_fr
# grouID  < `$ id -g` userID  < `$ id -u`

#FROM alpine:3.15
FROm node:16.14.0-alpine3.15

ENV GID 1001
ENV UID 1000

RUN apk add --no-cache bash tmux git openssh

#RUN addgroup -S swali -g $GID && \
#    adduser -S admin -u $UID -G swali -s /bin/bash

USER node 

RUN git config --global user.name "J Carlos" && \
    git config --global user.email "jhomanidev@gmail.com"

WORKDIR /home/node/app

EXPOSE 3001 

CMD ["yarn", "dev"] 
