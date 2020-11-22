#!/usr/bin/env sh

docker build -f Dockerfile.fpm --build-arg ENVIRONMENT=development -t mgdteam/php:7.4.4-fpm-nginx .
docker build -f Dockerfile.cli --build-arg ENVIRONMENT=development -t mgdteam/php:7.4.4-cli .

docker push mgdteam/php:7.4.4-fpm-nginx
docker push mgdteam/php:7.4.4-cli
