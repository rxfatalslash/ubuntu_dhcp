FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y isc-dhcp-server

WORKDIR /etc/default
RUN mv isc-dhcp-server isc-dhcp-server.old

COPY ./isc-dhcp-server/ .

WORKDIR /etc/dhcp
RUN mv dhcpd.conf dhcpd.conf.old

COPY ./dhcp/ .

EXPOSE 67
CMD ["isc-dhcp-server", "-D", "FOREGROUND"]

WORKDIR /