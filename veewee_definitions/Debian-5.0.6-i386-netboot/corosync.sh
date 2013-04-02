# setup corosync

wget https://github.com/sdoro/vagrant/raw/master/corosync_files/authkey
cp -p /etc/corosync/authkey /etc/corosync/authkey.org
cp authkey /etc/corosync/authkey
chown root.root /etc/corosync/authkey
chown go= /etc/corosync/authkey
wget https://github.com/sdoro/vagrant/raw/master/corosync_files/corosync.conf
cp -p /etc/corosync/corosync.conf /etc/corosync/corosync.conf.org
cp corosync.conf /etc/corosync/corosync.conf

sed -i 's/=no/=yes/g' /etc/default/corosync

