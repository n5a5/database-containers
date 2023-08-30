#!/usr/bin/env sh

TAG=latest
NAME=mariadb-"$TAG"
PORT=3306

docker volume create "${NAME}"
docker run -d \
    --name "${NAME}" \
    -p ${PORT}:3306 \
    -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=yes \
    --mount type=volume,source=${NAME},target=/var/lib/mysql \
    mariadb:${TAG}
