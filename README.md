# Dockerized Repository Builder


## Why...?

For developing purpose, or testing purpose, it might need to keep old-version,
but upstream packages provider might removed them, that would become a problem,
so building up a local repository for providing old-version would be required.


## Usage

Get builder images ready

    $ ./build.sh

Repository construction in Docker container

    $ docker run --rm --privileged=true                   \
        -v $(pwd)/repo:/repo:rw                           \
        -i -t guessi/docker-repository-builder:20.04      \
        "bash"                       # NOTE: DO NOT remove double quotes

check the repository generated

    # ls -l
    total 648
    -rw-r--r-- 1 root root   1311 Feb 11 15:49 Packages
    -rw-r--r-- 1 root root    814 Feb 11 15:49 Packages.gz
    -rw-r--r-- 1 root root 638312 Jun 29  2020 bash_5.0-6ubuntu1.1_amd64.deb

backup old repository

    $ sudo mv /var/www/html/repo/ /var/www/html/repo.old/

put the repository file to www service directory

    $ sudo mkdir -p /var/www/html/repo/
    $ sudo cp -rf repo/* /var/www/html/repo/

setup nginx/apache

    $ vim /etc/httpd/conf.d/repo.conf


## Client Side Configuration

    $ echo 'deb http://repository.server/repo /' | sudo tee /etc/apt/sources.list.d/repo.list
    $ sudo apt update
    $ sudo apt install bash=5.0-6ubuntu1.1
