FROM tozd/runit:ubuntu-focal

VOLUME /var/log/dockergen

ENV DOCKER_HOST unix:///var/run/docker.sock

RUN apt-get update -q -q && \
 apt-get install wget ca-certificates iptables --yes --force-yes && \
 mkdir /dockergen && \
 wget -P /dockergen https://github.com/jwilder/docker-gen/releases/download/0.7.4/docker-gen-linux-amd64-0.7.4.tar.gz && \
 tar xf /dockergen/docker-gen-linux-amd64-0.7.4.tar.gz -C /dockergen

RUN rm -rf /etc/service
COPY ./etc /etc
COPY ./dockergen /dockergen
