FROM node:lts-slim

RUN apt update \
    && apt install -y wget gnupg gnupg2 gnupg1 \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y \
       google-chrome-stable \
       fonts-noto-cjk \
       --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && npm i puppeteer mocha

