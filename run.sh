#!/bin/bash
if [[ ! -e /data/munkireport/db ]]; then mkdir -p /data/munkireport/db; chmod -R 777 /data/munkireport; fi
exec supervisord -n
