PHP application server
======================

This image provides ready to go application server based on Alpine, Nginx and PHP-FPM. 
Container main process is runit process. Also in the image we have some preinstalled apps:
`composer`, `git`, `openssh`.

Usage
--------------
    
To run this docker-compose below you should create .env file and
create `APP_HTTP_PORT` and `APP_HTTPS_PORT` variables.
    
    version: '3.7'
    
    services:
        app:
            image: mgdteam/php:7.4.4-fpm-nginx
            ports:
                - 127.0.0.1:${APP_HTTP_PORT}:80
                - 127.0.0.1:${APP_HTTPS_PORT}:443
            volumes:
                - ./app:/var/www/app:cached
            
        queue-worker:
            image: mgdteam/php:7.4.4-cli
            volumes:
                - ./app:/var/www/app:cached
            # Command can be run in container periodically
            # Command format: /entrypoint.cmd.sh <command> <run-interval-in-seconds>
            # Example: command: bin/console messenger:consume async -vv
            

Configure PHP and Nginx
-------------------------

To configure PHP and Nginx you should create new Dockerfile and override config files to your own. 
Dockerfile example:

    FROM mgdteam/php:7.4.4-fpm-nginx
    
    # Change php configuration
    ADD ./php/php.ini /usr/local/etc/php/php.ini
    
    # Change nginx configuration
    ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
    
    # Change nginx vhosts configuration
    ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
