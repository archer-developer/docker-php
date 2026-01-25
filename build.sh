#!/usr/bin/env sh

PLATFORMS=linux/amd64,linux/arm64,linux/arm/v7
IMAGE_NAME=mgdteam/php

PHP_VERSION="$1"

COMPOSER_VERSION=2.8.3

# Select a build preset with specific Alpine and Composer version
case $PHP_VERSION in

    "8.0")
        ALPINE_VERSION=3.16
        ;;
    "8.1")
        ALPINE_VERSION=3.20
        ;;
    "8.2")
        ALPINE_VERSION=3.20
        ;;
    "8.3")
        ALPINE_VERSION=3.22
        COMPOSER_VERSION=2.9.3
        ;;
    "8.4")
        ALPINE_VERSION=3.23
        COMPOSER_VERSION=2.9.3
        ;;
    "8.5")
        ALPINE_VERSION=3.23
        COMPOSER_VERSION=2.9.3
        ;;
esac

echo "\n================================="
echo "PHP version: $PHP_VERSION"
echo "Build platforms: $PLATFORMS"
echo "Alpine version: $ALPINE_VERSION"
echo "Composer version: $COMPOSER_VERSION"
echo "=================================\n"

docker buildx build --no-cache \
  --platform ${PLATFORMS} \
  -f Dockerfile.fpm \
  --build-arg PHP_VERSION=${PHP_VERSION} \
  --build-arg ALPINE_VERSION=${ALPINE_VERSION} \
  --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} \
  -t ${IMAGE_NAME}:${PHP_VERSION}-alpine${ALPINE_VERSION}-fpm-nginx . \
  --push

docker buildx build --no-cache \
  --platform ${PLATFORMS} \
  -f Dockerfile.cli \
  --build-arg PHP_VERSION=${PHP_VERSION} \
  --build-arg ALPINE_VERSION=${ALPINE_VERSION} \
  --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} \
  -t ${IMAGE_NAME}:${PHP_VERSION}-alpine${ALPINE_VERSION}-cli . \
  --push