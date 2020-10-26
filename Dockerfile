FROM ubuntu:20.04
LABEL maintainer="Kazuki Ishigaki<k-ishigaki@frontier.hokudai.ac.jp>"

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    python3-dev \
    python3-pip \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install platformio
RUN pip3 install -U platformio

ENV PATH=$PATH:/root/.platformio/penv/bin

RUN echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/developer && \
    chmod u+s `which groupadd` `which useradd` && \
    { \
    echo '#!/bin/sh -e'; \
    echo 'getent group `id -g` || groupadd --gid `id -g` developer'; \
    echo 'getent passwd `id -u` || useradd --uid `id -u` --gid `id -g` --home-dir /root developer'; \
    echo 'sudo chown --recursive `id -u`:`id -g` /root'; \
    echo 'exec "$@"'; \
    } > /entrypoint && chmod +x /entrypoint
ENTRYPOINT [ "/entrypoint" ]
