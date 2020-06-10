FROM ubuntu:latest

LABEL maintainer="FOREST6511"

RUN apt-get update && apt-get -y upgrade
RUN apt-get install --yes --no-install-recommends \
    autoconf \
    build-essential \
    sudo \
    curl \
    git \
    libtool \
    libc6-dev \
    pkg-config \
    unzip \
    zlib1g-dev \
    wget \
    vim \
    openjdk-11-jdk \
  && rm --recursive --force /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Install MeCab and Dic
RUN apt-get update && apt-get install --yes --no-install-recommends \
    mecab \
    libmecab-dev \
    mecab-ipadic \
    mecab-ipadic-utf8 \
    && rm --recursive --force /var/lib/apt/lists/*

RUN apt-cache showpkg mecab

# Install mecab-ipadic-neologd
# see https://github.com/neologd/mecab-ipadic-neologd/blob/master/README.ja.md
RUN cd /tmp \
    && git clone https://github.com/neologd/mecab-ipadic-neologd.git \
    && /tmp/mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y -a
