# RUN AS
#
# docker build -t database .
# docker run -ti -v database bash

FROM postgres:9.6.24-alpine3.15

ENV POSTGRES_PASSWORD=Test1235

RUN apk add --no-cache bash

USER postgres 

COPY --chown=postgres . /var/lib/postgresql/

RUN /bin/bash /var/lib/postgresql/init.sh

WORKDIR /var/lib/postgresql/
