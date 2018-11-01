#!/bin/bash

DOCKER_IMAGE_NAME=$1
cd operations

DOCKER_IMAGE_CUR_VERSION="$(grep CUR_VERSION .env.info  | sed -r 's!CUR_VERSION=(.*)!\1!')"
DOCKER_IMAGE_NEXT_VERSION="$(grep NEXT_VERSION .env.info  | sed -r 's!NEXT_VERSION=(.*)!\1!')"

if [ "$DOCKER_IMAGE_CUR_VERSION" == "$DOCKER_IMAGE_NEXT_VERSION" ];
    then
    echo "No need to update image what same version of $DOCKER_IMAGE_NAME."
    exit 0
fi

DOMAIN="lab.yukifans.com"
PROJECT="jenkins"

echo """
cd operations

docker build -t $DOMAIN/$PROJECT/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_NEXT_VERSION . -q

DOCKER_IMAGE_NEXT_HASH=\"docker images -q $DOMAIN/$PROJECT/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_NEXT_VERSION\"
\$DOCKER_IMAGE_NEXT_HASH

sed -ri -e 's/^(.*\/jenkins\/nginx:).*/\1'$DOCKER_IMAGE_NEXT_VERSION'/' run.sh
""" > ../build.sh

sed -ri -e 's/^(CUR_VERSION=).*/\1'"$DOCKER_IMAGE_NEXT_VERSION"'/' .env.info 