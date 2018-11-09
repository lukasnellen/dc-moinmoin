ARG baseimage=alpine:3.8
FROM $baseimage AS base

###########################################################
FROM base AS build

ARG version=1.9.10

LABEL maintainers="Lukas Nellen <lukas@nucleares.unam.mx>" \
      name="MoinMoin stand-alone servers - alpine builder" 

RUN apk add --no-cache \
  python2 \
  py-setuptools \
  py2-pip 

COPY moin-${version}.tar.gz /

RUN pip install --prefix=/opt moin-${version}.tar.gz 

###########################################################
FROM base

LABEL maintainers="Lukas Nellen <lukas@nucleares.unam.mx>" \
      name="MoinMoin stand-alone servers - alpine" 

RUN apk add --no-cache \
  python2 \
  py-setuptools \
  py2-docutils \
  xapian-bindings-python \
  py2-gunicorn

COPY --from=build /opt /opt
RUN mkdir /config

ENV PYTHONPATH=/opt/lib/python2.7/site-packages:/config/moin \
 PATH=/opt/bin:${PATH}

EXPOSE 8080

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
