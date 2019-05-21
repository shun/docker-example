FROM ubuntu:18.04

RUN apt update \
        && apt install -y \
           build-essential \
           curl \
	   git \
           openjdk-11-jre-headless \
           openssh-server \
           python \
           python-pip \
           python3 \
           python3-pip \
           software-properties-common \
           sudo \
           vim \
           whois \
        && rm -rf /var/lib/apt/lists*

RUN sed -i.bak "s;#PasswordAuthentication yes;PasswordAuthentication yes;g" /etc/ssh/sshd_config \
    && mkdir /var/run/sshd

RUN pip install -U mkdocs mkdocs-material Pygments plantuml-markdown

ARG WORKUSR=dev
RUN useradd -m -p `echo "$WORKUSR" | mkpasswd -s -m sha-512` -s /bin/bash $WORKUSR && gpasswd -a $WORKUSR sudo

