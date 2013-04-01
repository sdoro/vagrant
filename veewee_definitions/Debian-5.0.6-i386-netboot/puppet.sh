# Install puppet 3.0 from backports first so it will bring all the
# dependencies, then upgrade to puppet from puppetlabs.
# That is how I do on Lenny.
# https://groups.google.com/forum/?fromgroups=#!topic/puppet-users/eeqI35Uw-Qw
#
apt-get -t lenny-backports install -y puppet
wget http://apt.puppetlabs.com/puppetlabs-release-squeeze.deb
dpkg -i puppetlabs-release-squeeze.deb
apt-get update
apt-get -t puppetlabs install -y puppet
apt-get -y autoremove
#
# bot
