FROM java:8-jre-alpine

RUN addgroup proxy && adduser -g "DragonProxy user" -s /bin/ash -D proxy -G proxy
RUN apk --no-cache add curl \
        && curl -L -o /home/proxy/dragonproxy.jar https://github.com/DragonetMC/DragonProxy/releases/download/0.3.4.6/dragonproxy-0.3.4.6-SNAPSHOT.jar \
        && apk del curl

# USER proxy
COPY config.yml /home/proxy/config.yml

WORKDIR /home/proxy
EXPOSE 19132/udp
CMD ["java", "-Dorg.dragonet.proxy.profile=container", "-jar", "/home/proxy/dragonproxy.jar"]
