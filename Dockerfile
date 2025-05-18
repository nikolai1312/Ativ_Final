FROM postgres:17-alpine

ENV POSTGRES_USER=usuario
ENV POSTGRES_PASSWORD=senha123
ENV POSTGRES_DB=dbprog
ENV PGDATA=/var/lib/postgresql/data

COPY ./db.sql /docker-entrypoint-initdb.d
