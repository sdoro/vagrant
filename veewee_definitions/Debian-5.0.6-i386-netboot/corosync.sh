# setup corosync

wget https://github.com/sdoro/vagrant/raw/master/cluster-agents_files/symlink
chown root.root symlink
chmod u+x,go=rx symlink
mv symlink /usr/lib/ocf/resource.d/heartbeat

wget https://github.com/sdoro/vagrant/raw/master/corosync_files/authkey
cp -p /etc/corosync/authkey /etc/corosync/authkey.org
cp authkey /etc/corosync/authkey
chown root.root /etc/corosync/authkey
chown go= /etc/corosync/authkey

wget https://github.com/sdoro/vagrant/raw/master/corosync_files/corosync.conf
cp -p /etc/corosync/corosync.conf /etc/corosync/corosync.conf.org
cp corosync.conf /etc/corosync/corosync.conf

# I prefer to NOT start because I must change (manually) hostname ...
#sed -i 's/=no/=yes/g' /etc/default/corosync

wget https://github.com/sdoro/vagrant/raw/master/crm/test.cli

