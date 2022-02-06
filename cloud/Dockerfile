# RUN AS
#
# docker build -t backend_dev .
# docker run -p 9000:9000 -v $(pwd):/home/admin/app backend_dev
# grouID  < `$ id -g` userID  < `$ id -u`

FROM alpine:3.15

ENV GID 1001
ENV UID 1000

RUN apk add --no-cache nodejs npm yarn

RUN addgroup -S swali -g $GID && \
    adduser -S admin -u $UID -G swali -s /bin/bash

USER admin

EXPOSE 9000

WORKDIR /home/admin/app

CMD [ "node", "." ]


