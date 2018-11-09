ARG baseimage=debian:9-slim
FROM $baseimage AS base

RUN apt-get update && \
    apt-get upgrade --no-install-recommends --yes && \
    apt-get install --no-install-recommends --yes \
# build tools and helpers
    python \
    python-setuptools
    
###########################################################
FROM base AS build

ARG version=1.9.10

LABEL maintainers="Lukas Nellen <lukas@nucleares.unam.mx>" \
      name="MoinMoin stand-alone servers" 

RUN apt-get install --no-install-recommends --yes \
# build tools and helpers
    python-pip \
    python-wheel \
  && \
# cleanup
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY moin-${version}.tar.gz /

RUN pip install --prefix=/opt moin-${version}.tar.gz

###########################################################
FROM base

LABEL maintainers="Lukas Nellen <lukas@nucleares.unam.mx>" \
      name="MoinMoin stand-alone servers" 

RUN apt-get install --no-install-recommends --yes \
# required system packages
    iproute2 \
# build tools and helpers
    python-docutils \
    python-xapian \
# web runner
    gunicorn \
  && \
# cleanup
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=build /opt /opt
RUN mkdir /config

ENV PYTHONPATH=/opt/lib/python2.7/site-packages:/config/moin \
 PATH=/opt/bin:${PATH}

EXPOSE 8080

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
