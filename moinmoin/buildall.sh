#! /bin/sh

MOINMOINVERSION=1.9.10

docker build --build-arg version=${MOINMOINVERSION} -t lukasnellen/moinmoin -t lukasnellen/moinmoin:${MOINMOINVERSION} -f Dockerfile .
docker build --build-arg version=${MOINMOINVERSION} -t lukasnellen/moinmoin:${MOINMOINVERSION}-debug -f Dockerfile.debug .
docker build --build-arg version=${MOINMOINVERSION} -t lukasnellen/moinmoin:${MOINMOINVERSION}-slim -f Dockerfile.slim .
