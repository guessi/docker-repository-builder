# Dockerized Repository Builder

[![Docker Stars](https://img.shields.io/docker/stars/guessi/docker-repository-builder.svg)](https://hub.docker.com/r/guessi/docker-repository-builder/)
[![Docker Pulls](https://img.shields.io/docker/pulls/guessi/docker-repository-builder.svg)](https://hub.docker.com/r/guessi/docker-repository-builder/)
[![Docker Automated](https://img.shields.io/docker/automated/guessi/docker-repository-builder.svg)](https://hub.docker.com/r/guessi/docker-repository-builder/)


## Why...?

For developing purpose, or testing purpose, it might need to keep old-version,
but upstream packages provider might removed them, that would become a problem,
so building up a local repository for providing old-version would be required.


## Usage

Repository construction in Docker container

    $ docker run --rm --privileged=true                   \
        -v $(pwd)/repo:/repo:rw                           \
        -i -t guessi/docker-repository-builder            \
        "bash"                       # NOTE: DO NOT remove double quotes

check the repository generated

    $ ls -l $(pwd)/repo/
    -rw-r--r-- 1 guessi guessi 574740 May 18  2017 bash_4.3-7ubuntu1.7_amd64.deb
    -rw-r--r-- 1 guessi guessi   1327 Jan  6 13:10 Packages
    -rw-r--r-- 1 guessi guessi    824 Jan  6 13:10 Packages.gz

backup old repository

    $ sudo mv /var/www/html/repo/ /var/www/html/repo.old/

put the repository file to www service directory

    $ sudo mkdir -p /var/www/html/repo/
    $ sudo cp -rf repo/* /var/www/html/repo/

setup nginx/apache

    $ vim /etc/httpd/conf.d/repo.conf


## Client Side Configuration

    $ echo 'deb http://repository.server/repo /' | sudo tee /etc/apt/sources.list.d/repo.list
    $ sudo apt-get update
    $ sudo apt-get install bash=4.3-7ubuntu1.7
