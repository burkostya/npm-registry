# DOCKER-VERSION 1.2.0
# DESCRIPTION    npm registry
# TO_BUILD       docker build -t 'npm-registry' .
# TO_RUN         docker run -p 5984:5984 -p 80:80 npm-registry

FROM sameersbn/ubuntu:14.04.20140628

MAINTAINER Konstantin Burykin <burkostya@gmail.com>

RUN apt-get install -y python-software-properties && \
        add-apt-repository -y ppa:chris-lea/node.js && \
        apt-get -y update && \
        apt-get install -y dnsutils curl git nodejs couchdb

ADD assets/setup /app/setup
RUN chmod 755 /app/setup/install
RUN /app/setup/install

ADD assets/init /app/init
RUN chmod 755 /app/init

EXPOSE 5984 80

VOLUME ["/var/lib/couchdb"]

ENTRYPOINT ["/app/init"]
CMD ["app:start"]
