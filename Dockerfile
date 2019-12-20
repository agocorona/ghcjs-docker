
FROM ubuntu:16.04


## ensure locale is set during build
ENV LANG            C.UTF-8

## Haskell environment
RUN chmod -R 777 bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  root  run  sbin  srv  tmp  usr  var && \
    echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu xenial main' > \
      /etc/apt/sources.list.d/ghc.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      cabal-install-2.2 \
      ghc-8.4.2 \
      happy-1.19.5 \
      alex-3.1.7 \
      zlib1g-dev \
      libtinfo-dev \
      libsqlite3-0 \
      libsqlite3-dev \
      ca-certificates \
      build-essential \
      libgmp-dev \
      autoconf \
      automake \
      curl \
      g++ \
      python3 \
      git \
      netbase

ENV HOME /root
ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/bin:/opt/ghc/8.4.2/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.7/bin:/opt/ghcjs/.cabal-sandbox/bin:$PATH

## node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs


## build GHCJS
WORKDIR /

RUN cabal update && \
    git clone --branch ghc-8.4 https://github.com/ghcjs/ghcjs.git && \
    cd ghcjs && \
    git submodule update --init --recursive && \
    ./utils/makePackages.sh && \
    ./utils/makeSandbox.sh && \
    cabal install

ENV PATH /ghcjs/.cabal-sandbox/bin:$PATH

RUN  cd / && ghcjs-boot -v2 

RUN  cd / && /ghcjs/utils/makePackages.sh 

RUN  cd / && /ghcjs/utils/makeSandbox.sh && cabal install 

RUN   cd /root && chmod 777 -R .cabal .ghc .ghcjs .profile
   
#RUN  cd /ghcjs &&  \
#     ghcjs-boot -v2 && \
#    ./utils/makePackages.sh && \
#    ./utils/makeSandbox.sh && cabal install && \
#    cd / && chmod 777 -R .cabal .ghc .ghcjs .profile
#RUN cd ghcjs && \
#    ghcjs-boot -v2 && \
#    ./utils/makePackages.sh && \
#    ./utils/makeSandbox.sh && cabal install && \
#    rm -r .cabal-sandbox 
