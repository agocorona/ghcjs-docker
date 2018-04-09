FROM haskell:7.10.2



RUN apt-get update \
    && apt-get -y install build-essential git zlib1g-dev libtinfo-dev libgmp-dev autoconf curl

RUN curl -sL https://deb.nodesource.com/setup | bash - \
    && apt-get install -y nodejs

ENV PATH /root/.cabal/bin:$PATH

RUN cabal update && \
    cabal install --reorder-goals --max-backjumps=-1  cabal-install Cabal-1.24.2.0 && \
    echo $PATH && which cabal && cabal --version && \
    git clone https://github.com/ghcjs/ghcjs.git && \
    cabal install --reorder-goals --max-backjumps=-1 --force-reinstalls  ./ghcjs


RUN ghcjs-boot --dev
