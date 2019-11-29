FROM agocorona/ghcjs:8.4
RUN chmod -R 777 /bin   /dev  /home  /lib64  /mnt /root  /sbin    /usr /etc  /lib     /opt  /run   /srv   /tmp  /var

USER root
