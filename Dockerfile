FROM debian:buster-slim

RUN apt-get -y update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends curl gpg gpg-agent sudo bash && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sk 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
    if z=$(curl -sk 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi


WORKDIR /usr/src/zerotier

COPY start.sh /usr/src/zerotier/
RUN chmod +x /usr/src/zerotier/start.sh

ENTRYPOINT ["/usr/src/zerotier/start.sh"]