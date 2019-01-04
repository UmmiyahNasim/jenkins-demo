#!/usr/bin/env bash
cd $(dirname $0)

# stop on errors
set -e
./common.sh $@
export DEVENV=$1
export REGISTRY=$2
export TAG=$3

echo "Publishing environment: $1, registry: $2, version: $3"
cd ../build/docker/prod

docker push ${REGISTRY}/boxboat-blog-dotnet:${TAG}
docker tag ${REGISTRY}/boxboat-blog-dotnet:${TAG} ${REGISTRY}/boxboat-blog-dotnet:latest
docker push ${REGISTRY}/boxboat-blog-dotnet:latest
docker push ${REGISTRY}/boxboat-blog-nginx:${TAG}
docker tag ${REGISTRY}/boxboat-blog-nginx:${TAG} ${REGISTRY}/boxboat-blog-nginx:latest
docker push ${REGISTRY}/boxboat-blog-nginx:latest
docker push ${REGISTRY}/boxboat-blog-ui-ssr:${TAG}
docker tag ${REGISTRY}/boxboat-blog-ui-ssr:${TAG} ${REGISTRY}/boxboat-blog-ui-ssr:latest
docker push ${REGISTRY}/boxboat-blog-ui-ssr:latest
