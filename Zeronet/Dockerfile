FROM ubuntu:xenial
ADD Zeronet/build.sh build.sh
RUN chmod +x build.sh
RUN ./build.sh


FROM ubuntu:xenial
WORKDIR /root/
COPY --from=0 /tezos/tezos-* /usr/local/bin/
RUN apt update && apt-get install -y libgmp-dev libev-dev libusb-dev libhidapi-dev
RUN echo -e "http\t80/tcp\twww\t# WorldWideWeb HTTP" > /etc/services