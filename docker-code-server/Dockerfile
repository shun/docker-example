FROM ubuntu:18.04

RUN apt update \
	&& apt install -y curl \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/codercom/code-server/releases/download/1.792-vsc1.33.1/code-server1.792-vsc1.33.1-linux-x64.tar.gz \
	| tar -zxf - -C /

RUN ln -s /code-server1.792-vsc1.33.1-linux-x64 /code-server
