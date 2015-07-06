FROM armv7/armhf-archlinux:latest
MAINTAINER Flávio Lisbôa <flisboa.costa@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN pacman --noconfirm -Syyu rethinkdb && systemctl enable rethinkdb@default && systemctl start rethinkdb@default
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015
WORKDIR /data
VOLUME /data
CMD ["--bind", "all"]
ENTRYPOINT ["/usr/bin/rethinkdb"]
