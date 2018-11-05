MoinMoin wiki in a docker container
===================================

Run [MoinMoin](http://moinmo.in) in docker container, managed using
docker-compose, with [traefik](https://traefik.io) as the reverse
proxy for ingress. An example for the configuration of traefik can be
found in https://github.com/lukasnellen/dc-traefik.

The repository is configured to start a single wiki, with `MoinAdmin`
as the wiki super-user. The wiki contents is kept in the `data`
volume.


Images
------

The images are generated for the current stable version 1.9.10 of
[MoinMoin](http://moinmo.in).

* `lukasnellen/moinmoin:1.9.10` is based on alpine linux to provide a
  minimal container.

* `lukasnellen/moinmoin:1.9.10` is based on debian:9-slim to provide a
  small container, but with a regular glibc-based distribution.

* `lukasnellen/moinmoin:1.9.10` is based on debian:9, with extra tools
  included, to provide an image to work inside the container. This can
  be used to debug installation problems or to migrate data from an
  older version of the wiki.


Initial Setup of single wiki
----------------------------

1. Fix the labels in `docker-compose.yml` or set up ports to connect
the container to the outside.

2. In the browser, create an account `MoinAdmin` (or whatever you
changed the wiki super-user to). With that account, you then install
the system and help pages you need.

3. Stop the container and set the `page_front_page` and other options
in `moin-config/wikiconfig.py`. Review if you keep the self-service
creation of accounts enabled - see `actions_superuser`.

4. Start container and enjoy.

For more information or on how to use a farm setup to host multiple
wikis in one container, check the installation instructions in
http://moinmo.in/MoinMoinDownload. You presumably also want to modify
the volumes used to run the container to have one contianer per wiki, The suggesion is to mount the containers for the individual wikis under `/srv`.


Running commands in the container
---------------------------------

### Running without starting the regular container

```sh
docker-compose run --rm moin sh
```

This allows you to work with the container even when you cannot use
`docker-compose up` to start the container first. This can be handy
for preparing or migrating the wiki before serving the contents. Note
that this will create an extra container.

### Running inside the wiki container

```sh
docker-compose exec moin sh
```

This requires the container to start up with `docker-compose up` first.
