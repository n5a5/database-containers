#!/usr/bin/env sh

#alias docker="podman"

TAG=latest
NAME=cassandra-custom-$TAG
IMAGE_NAME=cassandra-custom:$TAG
PORT=9042

docker volume create $NAME
docker build -t $IMAGE_NAME .
docker run -d \
    --name $NAME \
    -p $PORT:9042 \
    --mount type=volume,source=$NAME,target=/var/lib/cassandra \
    $IMAGE_NAME

#keyspace: system user: cassandra password: cassandra
