FROM alpine:3.8
LABEL maintainer="spacemeowx2@gmail.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache aria2 supervisor lighttpd

# Install webui-aria2
RUN wget -O /tmp/webui-aria2.zip https://github.com/ziahamza/webui-aria2/archive/master.zip \
        && unzip /tmp/webui-aria2.zip -d /tmp/ \
        && mv /tmp/webui-aria2-master/ /var/www/localhost/htdocs/aria2 \
        && rm /tmp/webui-aria2.zip

COPY fs/ /
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME [ "/downloads" ]
EXPOSE 6800 5666

CMD [ "supervisord", "-c", "/etc/supervisord.conf" ]
