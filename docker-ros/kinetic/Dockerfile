FROM ros:kinetic

RUN apt update \
    && apt install -y \
        cmake \
        curl \
        git \
        htop \
        htop \
        nginx \
        nodejs \
        npm \
        ros-kinetic-rosbridge-suite \
        ros-kinetic-roswww \
        sudo \
        supervisor \
        tmux \
        vim \
        whois \
    && rm -rf /var/lib/apt/lists/* \
    && npm install n -g \
    && n stable \
    && npm install rosnodejs -g

ENV NODE_PATH=/usr/local/lib/node_modules
ARG WORKUSR=dev
RUN useradd -m -p `echo "$WORKUSR" | mkpasswd -s -m sha-512` -s /bin/bash $WORKUSR && gpasswd -a $WORKUSR sudo

EXPOSE 80

