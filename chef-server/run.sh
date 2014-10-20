#!/bin/sh
set -x
sysctl -w kernel.shmmax=17179869184 # for postgres
/opt/opscode/embedded/bin/runsvdir-start &
tail -F /opt/opscode/embedded/service/*/log/current

