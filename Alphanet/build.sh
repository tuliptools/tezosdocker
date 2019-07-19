#!/bin/bash
# mostly copy pasted from https://raw.githubusercontent.com/bitc0m/tezos/master/mainnet-fastbuild.sh

PREFIX=/usr/local/bin
OS_VER=$(lsb_release -a 2>&1 | grep 'Codename:' | awk '{print $2}')

#prerequisites
apt-get update
apt-get update
apt-get install -y curl software-properties-common



#Ubuntu 16.04 repositories
add-apt-repository ppa:ansible/bubblewrap
add-apt-repository ppa:git-core/ppa
apt-get update


#install build essentials
apt-get install -y patch unzip make gcc m4 git g++ aspcud bubblewrap pkg-config libhidapi-dev libgmp3-dev libev-libevent-dev


#download copy of linux opam 2.0.0 (RC4 final) build and save as /usr/local/bin/opam
/usr/bin/curl "https://raw.githubusercontent.com/ocaml/opam/7385f0b571a2e3dfd31c22deac40dbfee5f405f2/shell/install.sh" | bash -s 

#make opam executable
chmod a+x $PREFIX/opam


#initiate Opam
$PREFIX/opam init -y --compiler=4.07.1+flambda --disable-sandboxing

#evalute configuration environment
eval $(opam env)

#clone the tezos gitlab repo
git clone -b alphanet https://gitlab.com/tezos/tezos.git & wait
{ sleep 5; } & wait

cd tezos

#build project dependencies
make build-deps

#update opam environment
eval $(opam env)

#build tayzos
make
