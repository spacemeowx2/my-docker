FROM i386/debian
LABEL maintainer="spacemeowx2@gmail.com"

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN mkdir /data
WORKDIR /data

RUN apt update
RUN apt install -y \
    build-essential \
    git \
    cmake \
    make

RUN git clone --recursive https://github.com/minecraft-linux/mcpelauncher-manifest.git

RUN apt install -y zlib1g-dev libpng-dev

RUN mkdir -p cd /data/mcpelauncher-manifest/build \
    && cd /data/mcpelauncher-manifest/build \
    && cmake -DBUILD_CLIENT=OFF .. \
    && make
