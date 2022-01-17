# RUN AS
#
# docker build -t python .
# docker run -ti -v /home/mani/projects/readmer:/home/admin/readmer python bash
# grouID  < `$ id -g` userID  < `$ id -u`

FROM alpine:3.15

ENV GID 1001
ENV UID 1000

RUN apk add --no-cache bash python3 py3-pip tmux

RUN addgroup -S swali -g $GID && \
    adduser -S admin -u $UID -G swali -s /bin/bash

USER admin

WORKDIR /home/admin
