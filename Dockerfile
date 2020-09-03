FROM ubuntu:focal
MAINTAINER ldocky

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y tinyproxy

RUN apt-get autoremove -y && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
EXPOSE 8888
VOLUME /config

CMD ["tinyproxy", "-c", "/config/tiny.conf"]
