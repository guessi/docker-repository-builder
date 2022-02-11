#!/bin/bash

set -e

if [ -z "$@" ]; then
  echo "ABORT: no package defined"
  exit 1
fi

echo "=> Checking operation system..."
echo
echo "  $(grep ^VERSION= /etc/os-release | cut -d'"' -f2)"
echo

echo "=> Cleanup old caches..."
rm -f ./*.deb ./Packages*
echo

echo "=> Updating repository..."
apt update
echo

echo "=> Downloading packages and dependencies..."
apt install --reinstall -s $@ | awk '/^Inst/{print$2}' | xargs -r apt download
echo

echo "=> Generating packages index files..."
dpkg-scanpackages -m . /dev/null | tee Packages | gzip -9 > Packages.gz
echo
