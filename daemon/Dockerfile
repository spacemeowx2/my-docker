FROM alpine:3.8
LABEL maintainer="spacemeowx2@gmail.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache aria2 supervisor lighttpd curl

# Install webui-aria2
RUN curl -L -o /tmp/webui-aria2.zip https://github.com/ziahamza/webui-aria2/archive/master.zip \
        && unzip /tmp/webui-aria2.zip -d /tmp/ \
        && mv /tmp/webui-aria2-master/ /var/www/localhost/htdocs/aria2 \
        && sed -i 's/port: 6800/port: 5666/g' /var/www/localhost/htdocs/aria2/configuration.js \
        && sed -i 's/port: 6800/port: 5666/g' /var/www/localhost/htdocs/aria2/js/services/rpc/rpc.js \
        && rm /tmp/webui-aria2.zip

COPY fs/ /
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME [ "/downloads" ]
EXPOSE 5666

CMD [ "supervisord", "-c", "/etc/supervisord.conf" ]
