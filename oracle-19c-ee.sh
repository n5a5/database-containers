#!/usr/bin/env sh

# NB: Only works on aarch64 for now!

# Before executing the script, download $DB_ARCHIVE file using the link below
# and place the file in the root of the repo.
# https://www.oracle.com/database/technologies/oracle19c-linux-arm64-downloads.html
DB_ARCHIVE="LINUX.ARM64_1919000_db_home.zip"

ORA_REPO_FOLDER="./oracle-docker-images"
git clone --depth 1 https://github.com/oracle/docker-images.git $ORA_REPO_FOLDER
DOCKERFILES="$ORA_REPO_FOLDER/OracleDatabase/SingleInstance/dockerfiles"
VERSION="19.3.0"
cp $DB_ARCHIVE "$DOCKERFILES/$VERSION"
IMG_NAME_AND_TAG="oracle-database:19c-ee"
$DOCKERFILES/buildContainerImage.sh -v $VERSION -t $IMG_NAME_AND_TAG -e
rm -rf $ORA_REPO_FOLDER

NAME="oracle-database-19c-ee"
docker volume create $NAME
docker run -d \
  --name $NAME \
  -p 1521:1521 \
  -p 5500:5500 \
  -p 2484:2484 \
  -e ORACLE_SID=ORCLSID \
  -e ORACLE_PWD=TheStr0ngestPassw0rdInTheW0r1d \
  -e ORACLE_EDITION=enterprise \
  --mount type=volume,source=$NAME,target=/opt/oracle/oradata \
  $IMG_NAME_AND_TAG

# See the -e flags from the command above for connection details.
# For username, you can use SYS as SYSDBA.
