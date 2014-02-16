#!/bin/bash

APT_CMD="/usr/bin/apt-get -y -qq"
DOCKER_REPO="https://get.docker.io/ubuntu docker main"

$APT_CMD update
$APT_CMD install apt-transport-https
$APT_CMD install curl

#docker 
curl http://get.docker.io/gpg | apt-key add -
echo deb $DOCKER_REPO > /etc/apt/sources.list.d/docker.list
$APT_CMD update
$APT_CMD install --force-yes lxc-docker
