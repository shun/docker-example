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

EXPOSE 53 135 137/udp 138/udp 139 389 445 464 636

