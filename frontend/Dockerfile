# RUN AS
#
# docker build -t frontend .
# docker run -ti -v .:/home/admin/app frontend
# grouID  < `$ id -g` userID  < `$ id -u`

FROM alpine:3.15

ENV GID 1001
ENV UID 1000

RUN apk add --no-cache bash nodejs npm yarn git openssh

RUN addgroup -S swali -g $GID && \
    adduser -S admin -u $UID -G swali -s /bin/bash

USER admin

RUN git config --global user.name "J Carlos" && \
    git config --global user.email "jhomanidev@gmail.com"

WORKDIR /home/admin/app

EXPOSE 3001 

CMD ["yarn", "dev"] 
