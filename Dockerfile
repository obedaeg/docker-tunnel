FROM ubuntu:rolling

RUN DEBIAN_FRONTEND=noninteractive apt update \
	&& apt install -y autossh

RUN mkdir /keyfiles
copy docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

