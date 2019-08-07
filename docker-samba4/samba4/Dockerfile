FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y \
        krb5-config \
        samba \
        smbclient \
        supervisor \
        vim \
        winbind \
    && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /

