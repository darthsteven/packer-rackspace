APT_CMD="/usr/bin/apt-get -y -qq"

# Get the apt repo up to date.
$APT_CMD clean
$APT_CMD update

# Install git
$APT_CMD install git

# Install Java7
$APT_CMD install software-properties-common python-software-properties
$APT_CMD update
$APT_CMD install openjdk-7-jdk

$APT_CMD install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
$APT_CMD update
$APT_CMD install linux-image-extra-$(uname -r)
$APT_CMD install docker-engine
service docker start

# Install Docker compose
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Don't change git line endings:
git config --global core.autocrlf false

# Clenup
$APT_CMD clean
