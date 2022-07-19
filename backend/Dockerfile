# RUN AS
#
# docker build -t backend .
# docker run -ti -v ${pwd}:/home/admin/app backend bash
# grouID  < `$ id -g` userID  < `$ id -u`
# docker run -it -p 9000:9000 -v /home/jhomani/.ssh:/home/admin/.ssh -v /home/jhomani/projects/alcaldia_bk:/home/admin/app backend bash

FROM alpine:3.15

ENV GID 1001
ENV UID 1000

RUN apk add --no-cache bash nodejs npm yarn git tmux openssh

RUN npm i -g serverless

RUN addgroup -S swali -g $GID && \
    adduser -S admin -u $UID -G swali -s /bin/bash

USER admin

RUN git config --global user.name "J Carlos" && \
    git config --global user.email "jhomanidev@gmail.com"

WORKDIR /home/admin/app

EXPOSE 3001

CMD ["node", "."]
