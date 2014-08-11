macadmins-munkireport-php
=========================


Autobuild repository for [https://github.com/bruienne/macadmins-munkireport-php/](https://github.com/bruienne/macadmins-munkireport-php)

Contains Dockerfile and other needed files to create a munkireport-php image.

The main munkireport-php repository is here: [https://github.com/munkireport/munkireport-php](https://github.com/munkireport/munkireport-php)

Part of the Macadmins Docker project: [https://registry.hub.docker.com/u/macadmins](https://registry.hub.docker.com/u/macadmins)

Run instructions
================

Start the MR-PHP container as follows:

    $ docker run -d -v /data/munkireport -p 80:80 macadmins/munkireport-php

This will create a persistent storage volume on your Docker host and in the MR-PHP container. The database will be created there and persist after the container is stopped or removed.
