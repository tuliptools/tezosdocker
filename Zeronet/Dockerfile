FROM ubuntu:xenial
ADD build.sh build.sh
RUN chmod +x build.sh
RUN ./build.sh
RUN pwd


FROM ubuntu:xenial
WORKDIR /root/
COPY --from=0 /tezos/tezos-* /usr/local/bin/
RUN apt update && apt-get install -y libgmp-dev libev-dev
ENTRYPOINT ["bash"]  
