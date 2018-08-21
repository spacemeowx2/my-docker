FROM i386/ubuntu:18.04

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y wget

RUN wget -O /tmp/mcpeserver-core_0.1.0_amd64.deb https://dl.codehz.one/repo/ubuntu/mcpeserver-core_0.1.0_amd64.deb \
    && wget -O /tmp/mcpeserver_0.7.0_amd64.deb https://dl.codehz.one/repo/ubuntu/mcpeserver_0.7.0_amd64.deb \
    && dpkg-deb -R /tmp/mcpeserver-core_0.1.0_amd64.deb / && rm -rf /DEBIAN \
    && dpkg-deb -R /tmp/mcpeserver_0.7.0_amd64.deb / && rm -rf /DEBIAN \
    && rm /tmp/*.deb

COPY minecraft.apk /data/minecraft.apk

WORKDIR /data

RUN mcpeserver unpack

EXPOSE 19132/udp
CMD ["mcpeserver", "daemon"]
