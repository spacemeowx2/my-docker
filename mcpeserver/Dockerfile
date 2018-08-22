FROM i386/ubuntu:18.04 AS builder
LABEL maintainer="spacemeowx2@gmail.com"

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y wget

RUN mkdir /data \
    && wget -O /data/mcpeserver-core_0.1.0_amd64.deb https://dl.codehz.one/repo/ubuntu/mcpeserver-core_0.1.0_amd64.deb \
    && wget -O /data/mcpeserver_0.7.0_amd64.deb https://dl.codehz.one/repo/ubuntu/mcpeserver_0.7.0_amd64.deb \
    && dpkg-deb -R /data/mcpeserver-core_0.1.0_amd64.deb /data && rm -rf /data/DEBIAN \
    && dpkg-deb -R /data/mcpeserver_0.7.0_amd64.deb /data && rm -rf /data/DEBIAN \
    && rm /data/*.deb

RUN mkdir /mc \
    && mv /data/opt/mcpeserver-core /mc/bin

COPY minecraft.apk /mc/minecraft.apk
WORKDIR /mc
RUN /data/usr/bin/mcpeserver unpack && rm /mc/minecraft.apk

FROM i386/ubuntu:18.04

COPY --from=builder /data/ /
COPY --from=builder /mc /mc

EXPOSE 19132/udp
WORKDIR /mc
CMD ["/mc/bin/bedrockserver"]
