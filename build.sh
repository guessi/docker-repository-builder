#!/usr/bin/env bash

VERSIONS=(
  "14.04"
  "16.04"
  "18.04"
  "20.04"
  "22.04"
)

for VERSION in ${VERSIONS[@]}; do
  docker build \
    --build-arg VERSION=${VERSION} \
    -t guessi/docker-repository-builder:${VERSION} \
    .
done
