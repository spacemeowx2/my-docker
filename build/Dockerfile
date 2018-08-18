FROM debian
LABEL maintainer="spacemeowx2@gmail.com"

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt update && apt install -y build-essential linux-source bc kmod flex cpio libncurses5-dev libelf-dev vim

CMD [ "/bin/bash" ]
