#!/usr/bin/env sh

PLATFORMS=linux/amd64,linux/arm64,linux/arm/v7

phpVersion="$1"

if [[ "$phpVersion" = "7.4" ]] || [[ -z "$phpVersion" ]]
	then
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
fi

if [[ "$phpVersion" = "8.0" ]] || [[ -z "$phpVersion" ]]
	then
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
fi

if [[ "$phpVersion" = "8.1" ]] || [[ -z "$phpVersion" ]]
	then
    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.fpm \
      --build-arg PHP_VERSION=8.1 \
      --build-arg ALPINE_VERSION=3.17 \
      -t mgdteam/php:8.1-fpm-nginx . \
      --push

    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.cli \
      --build-arg PHP_VERSION=8.1 \
      --build-arg ALPINE_VERSION=3.17 \
      -t mgdteam/php:8.1-cli . \
      --push
fi

if [[ "$phpVersion" = "8.2" ]] || [[ -z "$phpVersion" ]]
	then
    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.fpm \
      --build-arg PHP_VERSION=8.2 \
      --build-arg ALPINE_VERSION=3.17 \
      --build-arg COMPOSER_VERSION=2.5.4 \
      -t mgdteam/php:8.2-fpm-nginx . \
      --push

    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.cli \
      --build-arg PHP_VERSION=8.2 \
      --build-arg ALPINE_VERSION=3.17 \
      --build-arg COMPOSER_VERSION=2.5.4 \
      -t mgdteam/php:8.2-cli . \
      --push
fi

if [[ "$phpVersion" = "8.3" ]] || [[ -z "$phpVersion" ]]
	then
    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.fpm \
      --build-arg PHP_VERSION=8.3 \
      --build-arg ALPINE_VERSION=3.19 \
      --build-arg COMPOSER_VERSION=2.7.7 \
      -t mgdteam/php:8.3-fpm-nginx . \
      --push

    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.cli \
      --build-arg PHP_VERSION=8.3 \
      --build-arg ALPINE_VERSION=3.19 \
      --build-arg COMPOSER_VERSION=2.7.7 \
      -t mgdteam/php:8.3-cli . \
      --push
fi

if [[ "$phpVersion" = "8.4.0alpha2" ]] || [[ -z "$phpVersion" ]]
	then
    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.fpm \
      --build-arg PHP_VERSION=8.4.0alpha2 \
      --build-arg ALPINE_VERSION=3.20 \
      --build-arg COMPOSER_VERSION=2.7.7 \
      -t mgdteam/php:8.4.0alpha2-fpm-nginx . \
      --push

    docker buildx build \
      --platform ${PLATFORMS} \
      -f Dockerfile.cli \
      --build-arg PHP_VERSION=8.4.0alpha2 \
      --build-arg ALPINE_VERSION=3.20 \
      --build-arg COMPOSER_VERSION=2.7.7 \
      -t mgdteam/php:8.4.0alpha2-cli . \
      --push
fi