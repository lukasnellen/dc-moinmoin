ARG baseimage=alpine:3.8
FROM $baseimage

ARG version=1.9.10
ENV MOINMOINVERSION=${version}

LABEL maintainers="Lukas Nellen <lukas@nucleares.unam.mx>" \
      name="MoinMoin stand-alone servers - alpine" 

RUN apk add --no-cache \
  python2 \
  py2-pip \
  py2-docutils \
  xapian-bindings-python \
  py2-gunicorn

COPY moin-${MOINMOINVERSION}.tar.gz /

RUN pip install --prefix=/opt moin-${MOINMOINVERSION}.tar.gz && \
    rm  moin-${MOINMOINVERSION}.tar.gz && \
    mkdir /config

ENV PYTHONPATH=/opt/lib/python2.7/site-packages:/config/moin \
 PATH=/opt/bin:${PATH}

EXPOSE 8080

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
