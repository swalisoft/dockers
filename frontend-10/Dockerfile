# RUN AS
#
# docker build -t node_10 .
# docker run -ti -v .:/home/admin/app node_10
# grouID  < `$ id -g` userID  < `$ id -u`

FROm node:10.13.0-alpine

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
