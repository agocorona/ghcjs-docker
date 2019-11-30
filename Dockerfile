FROM agocorona/ghcjs:8.4
RUN chmod 777 /
RUN setopt -s glob_dots && mv /root/* / && chmod -R 777 /*
# RUN mkdir /.cabal && chmod 777 /.cabal
# RUN chmod -R 777 /bin   /dev  /home  /lib64  /mnt /root  /sbin    /usr /etc  /lib     /opt  /run   /srv   /tmp  /var

USER root
