# RUN AS
#
# docker build -t node .
# docker run -ti -v /home/mani/projects/backend:/home/admin/backend node bash
# grouID  < `$ id -g` userID  < `$ id -u`

FROM alpine:3.15

ENV GID 1001
ENV UID 1000

RUN apk add --no-cache bash nodejs npm yarn tmux git openssh

RUN npm i -g @loopback/cli

RUN addgroup -S swali -g $GID && \
    adduser -S admin -u $UID -G swali -s /bin/bash

USER admin

COPY --chown=admin:swali ./ssh /home/admin/.ssh

RUN git config --global user.name "J Carlos" && \
    git config --global user.email "jhomanidev@gmail.com"

EXPOSE 9000

WORKDIR /home/admin/backend

CMD [ "node", "." ]


