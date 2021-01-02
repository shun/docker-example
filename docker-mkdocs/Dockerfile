FROM python:3-buster

WORKDIR /

RUN pip install -U \
        pip \
        mkdocs \
        mkdocs-material \
        plantuml-markdown \
    && mkdocs new docroot

WORKDIR /docroot

