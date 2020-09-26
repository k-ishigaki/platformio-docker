FROM ubuntu:20.04
LABEL maintainer="Kazuki Ishigaki<k-ishigaki@frontier.hokudai.ac.jp>"

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    make \
    python-dev \
    python-pip \
    && apt-get clean

# install platformio
RUN python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"
