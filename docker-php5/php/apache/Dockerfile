FROM php:5-apache as build_xdebug

RUN apt update \
    && apt install -y git \
    && cd / && git clone https://github.com/xdebug/xdebug.git -b XDEBUG_2_4_1 \
    && cd /xdebug && ./rebuild.sh

FROM php:5-apache

COPY --from=build_xdebug /xdebug/modules/xdebug.so /usr/local/lib/
RUN docker-php-ext-install pdo_mysql mysqli
