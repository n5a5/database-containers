#!/usr/bin/env sh

#alias docker=podman

TAG=latest
NAME=postgres-"$TAG"
VOLUME_NAME="$NAME"

docker volume create "$VOLUME_NAME"
docker run -d \
  --name $NAME \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  --mount type=volume,source=$VOLUME_NAME,target=/var/lib/postgresql/data \
  docker.io/library/postgres:${TAG}
