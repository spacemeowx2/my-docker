FROM alpine AS builder

RUN apk --no-cache add autossh
RUN mkdir /data \
    && mkdir -p /data/usr/bin \
    && mkdir /data/lib \
    && mkdir /data/etc \
    && cp /usr/bin/ssh /data/usr/bin/ssh \
    && cp /usr/bin/autossh /data/usr/bin/autossh \
    && cp /lib/ld-musl-x86_64.so.1 /data/lib/ld-musl-x86_64.so.1 \
    && cp /lib/libcrypto.so.43 /data/lib/libcrypto.so.43 \
    && cp /lib/libz.so.1 /data/lib/libz.so.1 \
    && echo "root:x:0:0:root:/:" > /data/etc/passwd

FROM scratch

COPY --from=builder /data /
