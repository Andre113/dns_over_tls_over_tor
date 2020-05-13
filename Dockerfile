FROM debian:latest

MAINTAINER "PiSkyScan <piskyscan@piskyscan.com>"

RUN apt-get update && apt-get install -y && \
        apt-get install -y  libyaml-dev libssl-dev git stubby proxychains procps tor net-tools && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Andre113/dns_over_tls_over_tor.git

WORKDIR dns_over_tls_over_tor
COPY stubby.yml /etc/stubby/stubby.yml
COPY proxychains.conf /etc/proxychains.conf
COPY run_stubby.sh /var/run/

RUN chmod +x /var/run/run_stubby.sh

EXPOSE 8053
EXPOSE 9050
EXPOSE 9051

ENTRYPOINT ["/bin/bash", "/var/run/run_stubby.sh"]



