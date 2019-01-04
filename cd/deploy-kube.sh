#!/usr/bin/env bash
cd $(dirname $0)

# stop on errors
set -e
./common.sh $@
export DEVENV=$1
export REGISTRY=$2
export TAG=$3

kubectl set image deployment/boxboat-blog-$DEVENV \
    dotnet=$REGISTRY/boxboat-blog-dotnet:$TAG \
    nginx=$REGISTRY/boxboat-blog-nginx:$TAG \
    ui-ssr=$REGISTRY/boxboat-blog-ui-ssr:$TAG
