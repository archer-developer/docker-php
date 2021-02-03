#!/usr/bin/env sh

docker build -f Dockerfile.fpm \
  --build-arg PHP_VERSION=7.4.4 \
  -t mgdteam/php:7.4.4-fpm-nginx .

docker build -f Dockerfile.cli \
  --build-arg PHP_VERSION=7.4.4 \
  -t mgdteam/php:7.4.4-cli .

docker build -f Dockerfile.fpm \
  --build-arg PHP_VERSION=8.0 \
  -t mgdteam/php:8.0-fpm-nginx .

docker build -f Dockerfile.cli \
  --build-arg PHP_VERSION=8.0 \
  -t mgdteam/php:8.0-cli .

docker push mgdteam/php:7.4.4-fpm-nginx
docker push mgdteam/php:7.4.4-cli
docker push mgdteam/php:8.0-fpm-nginx
docker push mgdteam/php:8.0-cli
