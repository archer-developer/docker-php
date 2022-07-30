#!/usr/bin/env sh

PLATFORMS=linux/amd64,linux/arm64,linux/arm/v7

docker buildx build \
  --platform ${PLATFORMS} \
  -f Dockerfile.fpm \
  --build-arg PHP_VERSION=7.4 \
  -t mgdteam/php:7.4-fpm-nginx . \
  --push

docker buildx build \
  --platform ${PLATFORMS} \
  -f Dockerfile.cli \
  --build-arg PHP_VERSION=7.4 \
  -t mgdteam/php:7.4-cli . \
  --push

docker buildx build \
  --platform ${PLATFORMS} \
  -f Dockerfile.fpm \
  --build-arg PHP_VERSION=8.0 \
  -t mgdteam/php:8.0-fpm-nginx . \
  --push

docker buildx build \
  --platform ${PLATFORMS} \
  -f Dockerfile.cli \
  --build-arg PHP_VERSION=8.0 \
  -t mgdteam/php:8.0-cli . \
  --push

docker buildx build \
  --platform ${PLATFORMS} \
  -f Dockerfile.fpm \
  --build-arg PHP_VERSION=8.1 \
  -t mgdteam/php:8.1-fpm-nginx . \
  --push

docker buildx build \
  --platform ${PLATFORMS} \
  -f Dockerfile.cli \
  --build-arg PHP_VERSION=8.1 \
  -t mgdteam/php:8.1-cli . \
  --push