FROM ubuntu:16.04

ENV UI_VERSION=v0.1.3 SERVER_VERSION=v0.1.0
ENV PROJECTDIR /go/src/github.com/cnrancher
ENV SERVERDIR ${PROJECTDIR}/cube-apiserver

WORKDIR ${SERVERDIR}

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /etc/ssh/*key*

RUN mkdir -p ${SERVERDIR} \
    && wget -O - https://github.com/cnrancher/cube-ui/releases/download/${UI_VERSION}/cube-ui.tar.gz | tar -xzf - -C ${PROJECTDIR} \
    && wget https://github.com/cnrancher/cube-apiserver/releases/download/${SERVER_VERSION}/rancher-cube-apiserver \
    && chmod +x ${SERVERDIR}/rancher-cube-apiserver

COPY config.yml ${SERVERDIR}/config.yml
COPY assets/images ${SERVERDIR}/assets/images
COPY build.sh ${SERVERDIR}/build.sh

ENTRYPOINT ["./build.sh"]