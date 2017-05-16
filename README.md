macadmins/munkireport-php
=========================


Autobuild repository for [https://github.com/bruienne/macadmins-munkireport-php/](https://github.com/bruienne/macadmins-munkireport-php)

Contains Dockerfile and other needed files to create a munkireport-php image.

The main munkireport-php repository is here: [https://github.com/munkireport/munkireport-php](https://github.com/munkireport/munkireport-php)

Part of the Macadmins Docker project: [https://registry.hub.docker.com/u/macadmins](https://registry.hub.docker.com/u/macadmins)

Run instructions
================

Start the MR-PHP container as follows:

`docker run -d -v /var/html/app/db -p 80:80 macadmins/munkireport-php`

This will create a persistent storage volume on your Docker host and in the MR-PHP container. The database will be created there and persist after the container is stopped or removed.

The default login/password is admin/admin - this can be changed by volume-binding your own config.php with a different admin password hash:

`docker run -d -v /var/html/app/db -v /path/to/your/config.php:/var/html/app/config.php -p 80:80 macadmins/munkireport-php`

The line to add looks like this (this is the password hash in the image):

`$auth_config['admin'] = '$P$BDnkPOMPV0BMGL7YROrT9ITzwk3ZWz/';`

The config_default.php file is sourced for initial settings. The above method will also apply if you wish to provide your own configuration for the MR-PHP application. Simply bind-mount the config.php file with your modifications.

Environment Variables
=====================

The following variables are exposed for configuration via environment:

- `SITENAME`: The name of your site, displayed in the title.
- `ADMIN_PASSWORD`: If you are using local authentication ONLY, the password hash for the *admin* account. Default is
    the password `admin`.
- `MODULES`: A comma delimited list of enabled modules.
- `IP_RANGES`: A comma delimited list of ip ranges to show in the network module.
- `ALLOW_MIGRATIONS`: Set to `TRUE` to allow database schema migrations (upgrades).
- `ENABLE_BUSINESS_UNITS`: Set to `TRUE` to enable business unit functionality.
- `CLIENT_PASSPHRASES`: A comma delimited list of accepted passphrases.
- `APPS_TO_TRACK`: A comma delimited list of application names to display on the applications report.

