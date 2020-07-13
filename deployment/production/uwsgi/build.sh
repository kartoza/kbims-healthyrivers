#!/usr/bin/env bash

if [ -z "$REPO_NAME" ]; then
	REPO_NAME=kartoza
fi

if [ -z "$IMAGE_NAME" ]; then
	IMAGE_NAME=freshwaterbiodiversity
fi

if [ -z "$TAG_NAME" ]; then
	TAG_NAME=v3.0
fi

if [ -z "$BUILD_ARGS" ]; then
	BUILD_ARGS="--pull --no-cache"
fi

# Build Args Environment

if [ -z "$HEALTHYRIVERS_TAG" ]; then
	HEALTHYRIVERS_TAG=3.0
fi

if [ -z "$BIMS_TAG" ]; then
	BIMS_TAG=v3.0
fi

echo "HEALTHYRIVERS_TAG=${HEALTHYRIVERS_TAG}"

echo "Build: $REPO_NAME/$IMAGE_NAME:$TAG_NAME"

docker build -t ${REPO_NAME}/${IMAGE_NAME} \
	--build-arg HEALTHYRIVERS_TAG=${HEALTHYRIVERS_TAG} --build-arg BIMS_TAG=${BIMS_TAG} \
	${BUILD_ARGS} .
docker tag ${REPO_NAME}/${IMAGE_NAME}:latest ${REPO_NAME}/${IMAGE_NAME}:${TAG_NAME}
docker push ${REPO_NAME}/${IMAGE_NAME}:${TAG_NAME}
