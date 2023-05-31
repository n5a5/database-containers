#!/usr/bin/env sh

VOLUME_NAME=mongo-data

docker volume create ${VOLUME_NAME}
docker run -d \
    --name mongo \
    -p 27017:27017 \
    --mount type=volume,source=${VOLUME_NAME},target=/data/db \
    registry.hub.docker.com/library/mongo
