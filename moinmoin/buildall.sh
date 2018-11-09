#! /bin/sh

set -e

MOINMOINVERSION=1.9.10

docker build --pull --build-arg version=${MOINMOINVERSION} -t lukasnellen/moinmoin -t lukasnellen/moinmoin:${MOINMOINVERSION} \
       -f Dockerfile .
docker build --pull --build-arg version=${MOINMOINVERSION} -t lukasnellen/moinmoin:${MOINMOINVERSION}-debug \
       -f Dockerfile.debug .
docker build --pull --build-arg version=${MOINMOINVERSION} -t lukasnellen/moinmoin:${MOINMOINVERSION}-slim \
       -f Dockerfile.slim .
