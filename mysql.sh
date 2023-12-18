#!/usr/bin/env sh

TAG=latest
NAME=mysql-"$TAG"
PORT=3307

docker volume create "${NAME}"
docker run -d \
    --name "${NAME}" \
    -p ${PORT}:3306 \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    --mount type=volume,source=${NAME},target=/var/lib/mysql \
    mysql:${TAG}
