FROM agocorona/ghcjs:8.4
RUN chmod 777 / && cd /root && mv .bashrc .cabal .config .ghcjs .profile  / && cd / && chmod 777 -R .bashrc .cabal .config .ghcjs .profile
USER root
