# RUN AS
#
# docker build -t backend_dev .
# docker run -p 9000:9000 -v /home/mani/projects/backend:/home/admin/backend backend_dev
# grouID  < `$ id -g` userID  < `$ id -u`

FROM alpine:3.15

RUN apk add --no-cache nodejs npm yarn

RUN addgroup -S swali && \
    adduser -S admin -G swali -s /bin/bash

USER admin

EXPOSE 9000

WORKDIR /home/admin/backend

CMD [ "node", "." ]


