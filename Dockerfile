FROM ubuntu:20.04
LABEL maintainer="Kazuki Ishigaki<k-ishigaki@frontier.hokudai.ac.jp>"

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    python3-dev \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install platformio
RUN pip3 install -U platformio

ENV PATH=$PATH:/root/.platformio/penv/bin
