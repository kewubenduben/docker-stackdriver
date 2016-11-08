from ubuntu:14.04
MAINTAINER Andre Cantero <thecantero@gmail.com>

# Update
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl libhiredis0.10 lsb-release &&  \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

# stackdriver
RUN curl -O https://repo.stackdriver.com/stack-install.sh && \
    bash stack-install.sh --write-gcm && \
    /opt/stackdriver/stack-config --write-gcm && \
    service stackdriver-agent restart

VOLUME /opt/stackdriver/collectd/etc/collectd.d

CMD [ "while true; do echo stackdriver-loop; sleep 60; done"]
