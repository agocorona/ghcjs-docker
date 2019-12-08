FROM agocorona/ghcjs:8.4
#RUN cd / && touch .bashrc .cabal .config .ghcjs .profile &&  chmod 777  / && chmod 777 -R .bashrc .cabal .config .ghcjs .profile && cd /root && chmod 777 -R .bashrc .cabal .config .ghcjs .profile
RUN cd / && mkdir .ghc .bashrc .cabal .config .ghcjs .profile && set - e && chmod -fR 777 / || true
RUN cabal update
