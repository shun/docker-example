FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y \
        apache2 \
        ldap-account-manager \
        libapache2-mod-php \
        php \
        php-cgi \
        php-common \
        php-mbstring \
        php-pear \
        supervisor \
        vim \
    && rm -rf /var/lib/apt/lists/*

