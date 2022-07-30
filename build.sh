#!/usr/bin/env sh

docker buildx build --platform linux/amd64,linux/arm64 -f Dockerfile.fpm \
  --build-arg PHP_VERSION=7.2 \
  -t mgdteam/php:7.2-fpm-nginx .

docker buildx build --platform linux/amd64,linux/arm64 -f Dockerfile.cli \
  --build-arg PHP_VERSION=7.2 \
  -t mgdteam/php:7.2-cli .

docker push mgdteam/php:7.2-fpm-nginx
docker push mgdteam/php:7.2-cli