FROM debian:stable

RUN apt-get update && apt-get install -y python

COPY ./deb /tmp/deb

RUN dpkg -i /tmp/deb/*6.0.18*.deb && rm -rf /tmp/deb

RUN update-rc.d foundationdb disable \
    && rm -rf /var/lib/foundationdb/data/4500/ \
    && rm -rf /var/log/foundationdb/* \
    && rm -rf /etc/foundationdb/fdb.cluster

COPY ./k8s.entrypoint.sh /home/entrypoint.sh

EXPOSE 4500

ENTRYPOINT bash /home/entrypoint.sh