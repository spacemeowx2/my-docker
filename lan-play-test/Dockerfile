FROM ubuntu:18.04
LABEL maintainer="spacemeowx2@gmail.com"

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt update && apt install -y \
    net-tools

RUN echo "auto eth0" >> /etc/networks \
    && echo "iface eth0 inet static" >> /etc/networks \
    && echo "        address 10.13.37.66" >> /etc/networks \
    && echo "        netmask 255.255.255.0" >> /etc/networks \
    && echo "        gateway 10.13.37.1" >> /etc/networks
