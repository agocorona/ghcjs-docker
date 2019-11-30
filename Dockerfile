FROM agocorona/ghcjs:latest
RUN chmod 777 /
RUN mkdir /.ghc && chmod 777 /.ghc
# RUN mkdir /.cabal && chmod 777 /.cabal
# RUN chmod -R 777 /bin   /dev  /home  /lib64  /mnt /root  /sbin    /usr /etc  /lib     /opt  /run   /srv   /tmp  /var

USER root
