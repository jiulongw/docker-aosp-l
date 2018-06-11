FROM ubuntu:trusty

MAINTAINER Jiulong Wang "jiulongw@gmail.com"

# Installing packages
RUN apt-get update \
    && apt-get install -y \
    bc \
    bison \
    build-essential \
    curl \
    g++-multilib \
    gperf \
    lib32z-dev \
    libxml2-utils \
    lzop \
    openjdk-7-jdk \
    openjdk-7-jre \
    python \
    sudo \
    zip \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre

# Add build user account
ENV RUN_USER android
ENV RUN_UID 1000

RUN id $RUN_USER || adduser --uid "$RUN_UID" \
    --gecos 'Android Builder' \
    --shell '/bin/bash' \
    --disabled-login \
    --disabled-password "$RUN_USER"

# Allow user sudo without password
RUN usermod -a -G sudo $RUN_USER
RUN sed -i '/^%sudo/c%sudo ALL=(ALL:ALL) NOPASSWD:ALL' /etc/sudoers

USER $RUN_USER
