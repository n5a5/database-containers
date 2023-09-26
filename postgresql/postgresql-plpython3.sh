#!/usr/bin/env sh


BASE_NAME="postgresql-plpython3"
VERSION=15
NAME=$BASE_NAME-$VERSION
IMAGE=$BASE_NAME:$VERSION

#VOLUME=$NAME-data
#docker volume create $VOLUME

docker build -t $IMAGE .
docker run -d \
  --name $NAME \
  -p 5433:5432 \
  -e POSTGRES_PASSWORD=postgres \
  --mount type=volume,source=${NAME},target=/var/lib/postgresql/data \
  $IMAGE
