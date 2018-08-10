#!/usr/bin/env bash

if [ -z "$REPO_NAME" ]; then
	REPO_NAME=kartoza
fi

if [ -z "$IMAGE_NAME" ]; then
	IMAGE_NAME=healthyrivers_uwsgi
fi

if [ -z "$TAG_NAME" ]; then
	TAG_NAME=latest
fi

if [ -z "$BUILD_ARGS" ]; then
	BUILD_ARGS="--pull --no-cache"
fi

# Build Args Environment

if [ -z "HEALHTYRIVERS_TAG" ]; then
	HEALHTYRIVERS_TAG=develop
fi

echo "HEALHTYRIVERS_TAG=${HEALHTYRIVERS_TAG}"

echo "Build: $REPO_NAME/$IMAGE_NAME:$TAG_NAME"

docker build -t ${REPO_NAME}/${IMAGE_NAME} \
	--build-arg HEALHTYRIVERS_TAG=${HEALHTYRIVERS_TAG} \
	${BUILD_ARGS} .
docker tag ${REPO_NAME}/${IMAGE_NAME}:latest ${REPO_NAME}/${IMAGE_NAME}:${TAG_NAME}
docker push ${REPO_NAME}/${IMAGE_NAME}:${TAG_NAME}
