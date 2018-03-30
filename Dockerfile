#
# Official Dockerfile for a5a-cpuminer
# usage: docker run androidcoin-project/a5a-cpuminer --url stratum+tcp://SERVER:PORT --user WALLET --pass X
#

FROM  ubuntu:17.10

RUN  apt-get update -qq && apt-get upgrade -y

RUN  apt-get install -qqy autotools-dev autotools-dev \
  automake git build-essential libgmp3-dev \
  libcurl4-openssl-dev libboost-all-dev

RUN  git clone https://github.com/androidcoin-project/a5a-cpuminer.git

WORKDIR  /a5a-cpuminer

RUN  ./autogen.sh && ./configure CFLAGS="-O3" CXXFLAGS="-O3" && make

ENTRYPOINT  ["/a5a-cpuminer/minerd"]
