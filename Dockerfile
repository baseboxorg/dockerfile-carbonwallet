# coinpunk, insight-api, bitcoind, redis-server, nginx,etcd registration, confd and supervisord on trusty
FROM markusma/nginx-etcd:trusty

RUN apt-add-repository ppa:chris-lea/node.js

RUN apt-get update \
 && apt-get install -y --no-install-recommends nodejs build-essential git-core \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/carbonwallet/carbonwallet.github.io /opt/carbonwallet

ADD config/etc/confd /etc/confd

EXPOSE 5000
CMD [ "/init" ]
