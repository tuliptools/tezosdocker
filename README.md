# Tezos Docker Images

This is not a drop in replacement for tezos/tezos:mainnet!

This image has no entrypoint scrits etc, just the binaries.

Images from this repo are built automatically by dockerhub:
https://hub.docker.com/r/tuliptools/tezos

## Copy and Paste

```
docker pull tuliptools/tezos:mainnet
docker volume create tezdata
docker run -it --rm -v teezdata:/root/.tezos-node tuliptools/tezos:mainnet tezos-node identity generate
docker run -d --name tezos -v teezdata:/root/.tezos-node tuliptools/tezos:mainnet tezos-node run
docker logs -f tezos
```
