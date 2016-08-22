#!/bin/sh

set -e
set -x

if [ -n "$@" ]; then
  apt-get update # make sure we are using latest packages index
  apt-get install --reinstall -s $@ | awk '/^Inst/{print$2}' | xargs -r -n 1 apt-get download
  dpkg-scanpackages -m . /dev/null | tee Packages | gzip -9 > Packages.gz
fi
