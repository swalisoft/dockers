# RUN AS
#
# docker build -t postgres_db .
# docker run -p 5432:5432 -t postgres_db

FROM postgres:9.6.24-alpine3.15

ENV POSTGRES_PASSWORD=34353435
ENV POSTGRES_DB alcaldia 

COPY init.sql /docker-entrypoint-initdb.d/

USER postgres 

#COPY --chown=postgres . /var/lib/postgresql/

#RUN /bin/bash /var/lib/postgresql/init.sh

#WORKDIR /var/lib/postgresql/

EXPOSE 5432

CMD ["postgres"]
