FROM node:lts-alpine

RUN apk update \
    && apk add \
        bash \
        vim \
        tmux \
        nginx \
    && npm install -g @vue/cli \ 
    && mkdir -p /run/nginx

EXPOSE 80

