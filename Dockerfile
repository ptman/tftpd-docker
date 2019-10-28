# vim: set ft=dockerfile:
FROM alpine:latest
# Author with no obligation to maintain
LABEL author="Paul Tötterman <paul.totterman@iki.fi>"

RUN apk add --no-cache tftp-hpa \
    && mkdir -p /srv/tftproot \
    && wget -O- http://archive.ubuntu.com/ubuntu/dists/bionic-updates/main/installer-amd64/current/images/netboot/netboot.tar.gz | tar xvzf - -C /srv/tftproot

EXPOSE 69/udp
CMD ["/usr/sbin/in.tftpd", "-L", "-s", "/srv/tftproot"]
