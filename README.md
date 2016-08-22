Setup Guide for Building Local Repository
-----------------------------------------

### Server Side Configuration

Preparation - Docker image for repository construction

    $ sudo docker build -t repo_builder .

      OR

    $ sudo docker build --no-cache -t repo_builder .  ### RECOMMEND ###

Cleanup obsoleted packages before start

    $ sudo rm -iv repo/*

Repository construction in Docker container

    $ sudo docker run --rm -v $(pwd)/repo:/repo:rw -i -t repo_builder "<package_list_here>"

check if the repository for the target packages is generated

    $ ls -l $(pwd)/repo/
    -rw-r--r-- 1 root root 575658 Oct  9  2014 bash_4.3-7ubuntu1.5_amd64.deb
    -rw-r--r-- 1 root root   2638 Aug 22 16:19 Packages
    -rw-r--r-- 1 root root   1401 Aug 22 16:19 Packages.gz
    -rw-r--r-- 1 root root 391240 Jan  3  2014 vim-tiny_2%3a7.4.052-1ubuntu3_amd64.deb

put the repository file to www service directory

    $ sudo cp -f repo/* /var/www/html/repo/


### Client Side Configuration

    $ echo 'deb http://repo-server.domain/repo /' | tee /etc/apt/sources.list.d/myrepo.list
    $ sudo apt-get clean && sudo apt-get update
    $ sudo apt-get install bash=4.3-7ubuntu1.5
