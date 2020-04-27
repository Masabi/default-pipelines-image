FROM ruby:2.6

# Install base dependencies
RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
        build-essential \
        wget \
        curl \
        git \
        ssh-client \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# Install awscli
RUN curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli

# Install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

ENTRYPOINT /bin/bash