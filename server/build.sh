#!/bin/sh
set -ex

CONFIGDIR=/var/lib/rancher/cube

if [ ! -e ${CONFIGDIR} ]; then
    echo "path does not exist "
    mkdir -p ${CONFIGDIR}
fi

if [ ! -f ${CONFIGDIR}/config.yml ]; then
    echo "file does not exist"
    cp config.yml ${CONFIGDIR}/config.yml
fi

./rancher-cube-apiserver serve --listen-addr 0.0.0.0:9600 --config ${CONFIGDIR}/config.yml