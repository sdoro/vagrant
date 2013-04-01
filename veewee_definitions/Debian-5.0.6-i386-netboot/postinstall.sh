date > /etc/vagrant_box_build_time

# As of Jul 8, 2010, packages for the whole Linux-HA clusterstack
# (corosync, openais, heartbeat, cluster-glue, cluster-agents, pacemaker)
# are available from the official backports repository for Debian
# GNU/Linux 5.0.
#cat <<EOF>/etc/apt/sources.list.d/pa.list
#deb http://people.debian.org/~madkiss/ha-corosync lenny main
#EOF

cat <<EOF>/etc/apt/sources.list.d/bpo5.list
deb http://archive.debian.org/debian-archive/backports.org/ lenny-backports main
EOF

#apt-key adv --keyserver pgp.mit.edu --recv-key 1CFA3E8CD7145E30
apt-key adv --keyserver pgp.mit.edu --recv-key EA8E8B2116BA136C

#Updating the box
apt-get -y update
apt-get clean

echo "Install base packages"
apt-get -y install less mc ssh logwatch vim mutt procmail mailx

echo "Install pacemaker"
apt-get -y --force-yes install pacemaker

#Setting up sudo
echo "Setting sudo"
cp /etc/sudoers /etc/sudoers.orig
sed -i -e 's/vagrant ALL=(ALL) ALL/vagrant ALL=NOPASSWD:ALL/g' /etc/sudoers

#Installing vagrant keys
#mkdir /home/vagrant/.ssh
#chmod 700 /home/vagrant/.ssh
#cd /home/vagrant/.ssh
#wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
#chmod 600 /home/vagrant/.ssh/authorized_keys
#chown -R vagrant /home/vagrant/.ssh


# Zero out the free space to save space in the final image:
echo "Zero out the free space"
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp3/*

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces
exit
