FROM mhart/alpine-node:8.8
MAINTAINER Emad Shaaban <emad@bizzotech.com>

RUN apk add --update \
    alpine-sdk \
    linux-headers \
    py2-pip \
    python-dev \
    libxslt-dev \
    mariadb-client \
    mariadb-dev \
    zlib-dev \
    jpeg-dev \
    libffi-dev \
    xvfb \
    ttf-freefont \
    fontconfig \
    dbus && \
    apk add wkhtmltopdf --update-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --allow-untrusted && \
    mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin && \
    echo $'#!/usr/bin/env sh\n\
          Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset & \n\
          DISPLAY=:0.0 wkhtmltopdf-origin $@ \n\
          killall Xvfb\
          ' > /usr/bin/wkhtmltopdf && \
    chmod +x /usr/bin/wkhtmltopdf && \
    rm -rf /var/cache/apk/* && \
    pip install --upgrade pip
