FROM ros:dashing

RUN apt update \
    && apt install -y \
        curl \
        nginx \
        ros-${ROS_DISTRO}-rosbridge-server \
        sudo \
        supervisor \
        vim \
        whois \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt install -y nodejs \
    && npm install -g @vue/cli \
    && mkdir -p /var/log/supervisor \
    && rm -rf /var/lib/apt/lists/* \
    && npm cache clean --force

ARG WORKUSR=ros
RUN useradd -m -p `echo "$WORKUSR" | mkpasswd -s -m sha-512` -s /bin/bash $WORKUSR && gpasswd -a $WORKUSR sudo

