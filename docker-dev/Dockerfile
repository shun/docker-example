FROM ubuntu:18.04

ARG LLVM_VERSION=7
RUN apt update \
        && apt install -y \
            build-essential \
            clang-${LLVM_VERSION} \
            clang-format-${LLVM_VERSION} \
            clang-tools-${LLVM_VERSION} \
            cmake \
            curl \
            git \
            htop \
            lldb-${LLVM_VERSION} \
            llvm-${LLVM_VERSION} \
            ninja-build \
            openssh-server \
            peco \
            python3 \
            python3-pip \
            sudo \
            tig \
            vim \
            whois \
            xsel \
        && rm -rf /var/lib/apt/lists/*

RUN pip3 install -U pynvim

RUN sed -i.bak "s;#PasswordAuthentication yes;PasswordAuthentication yes;g" /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

ARG WORKUSR=dev
RUN useradd -m -p `echo "$WORKUSR" | mkpasswd -s -m sha-512` -s /bin/bash $WORKUSR && gpasswd -a $WORKUSR sudo

CMD ["/usr/sbin/sshd", "-D"]

