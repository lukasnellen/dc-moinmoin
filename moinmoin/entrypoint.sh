#! /bin/sh

export GATEWAY=$(ip route list | awk '/default/ { print $3 }')

if [ -z "$*" ]; then
#    exec gunicorn -b :8080 MoinMoin.server.wsgi:moinmoinApp
    exec gunicorn -b :8080 --forwarded-allow-ips="*" moin_wsgi
else
    exec "$@"
fi
