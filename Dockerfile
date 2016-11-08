from ubuntu:14.04
MAINTAINER Andre Cantero <thecantero@gmail.com>

# Update
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl libhiredis0.10 lsb-release && \
    curl -O https://repo.stackdriver.com/stack-install.sh && \
    bash stack-install.sh --no-start --genhostid --force-hostid --write-gcm && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /opt/stackdriver/collectd/etc/collectd.d

COPY run.sh /bin/run.sh
ENTRYPOINT ["/bin/run.sh"]
