#!/usr/bin/env sh

# ee or aws. Community doesn't work for now due to a not needed hyphen
EDITION=ee
TAG=latest
NAME=cloudbeaver-"$EDITION"-"$TAG"
VOLUME_NAME="$NAME"-workspace
PORT=8998

docker volume create "$VOLUME_NAME"
docker run -d \
  --name $NAME \
  -p "$PORT":8978 \
  --mount type=volume,source=$VOLUME_NAME,target=/opt/cloudbeaver/workspace \
  dbeaver/cloudbeaver-"$EDITION":"$TAG"
  
