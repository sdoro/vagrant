#Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_VERSION=4.1.18

if test -f $VBOX_VERSION
  cd /tmp
  wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
  mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt


  # install build essential for VirtualBox module 'vboxsf'
  apt-get -y update
  apt-get -y install linux-headers-$(uname -r) build-essential
  apt-get -y install zlib1g-dev libssl-dev libreadline5-dev
  apt-get clean


  yes|sh /mnt/VBoxLinuxAdditions.run
  umount /mnt

  apt-get -y remove linux-headers-$(uname -r) build-essential
  apt-get -y autoremove

  rm VBoxGuestAdditions_$VBOX_VERSION.iso
fi
