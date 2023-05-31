#!/usr/bin/env sh

VOLUME_NAME=neo4j-data

docker volume create ${VOLUME_NAME}
docker run -d \
    --name neo4j \
    -p 7474:7474 \
    -p 7687:7687 \
    --mount type=volume,source=${VOLUME_NAME},target=/data \
    registry.hub.docker.com/library/neo4j
