apt-get update
apt-get install -y git
apt-get install -y wget
apt-get install -y python-pip

pip install mercurial

# set PYTHON environment variable for fast export
echo 'export PYTHON=/usr/bin/python' >> /home/vagrant/.profile
source /home/vagrant/.profile

# create these sub directories
mkdir -p /home/vagrant/Hg2GitConvert/GIT
mkdir -p /home/vagrant/Hg2GitConvert/MERC

# download the fast export repo
cd /home/vagrant
git clone https://github.com/frej/fast-export.git
