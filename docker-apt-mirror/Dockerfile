FROM ubuntu:18.04

RUN apt update \
    && apt install -y --no-install-recommends \
        apt-mirror \
    && rm -rf /var/lib/apt/lists/*
