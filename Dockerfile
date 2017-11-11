FROM node:8
MAINTAINER Emad Shaaban <emad@bizzotech.com>

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get install -y software-properties-common python-software-properties && \
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db && \
    add-apt-repository "deb http://ams2.mirrors.digitalocean.com/mariadb/repo/10.0/debian jessie main" && \
    apt-get update && \
    apt-get install -y curl wget python-mysqldb \
          git build-essential python-setuptools python-dev libffi-dev libssl-dev  \
          ntp vim screen htop mariadb-common libmariadbclient-dev \
			    libxslt1.1 libxslt1-dev libcrypto++-dev postfix libtiff5-dev libjpeg62-turbo-dev \
				  liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk zlib1g-dev libfreetype6-dev \
			    supervisor python-pip fontconfig libxrender1 libxext6 xfonts-75dpi xfonts-base \
          && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.2.1/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-jessie-amd64.deb && rm wkhtmltox-0.12.2.1_linux-jessie-amd64.deb

RUN pip install --upgrade setuptools pip
