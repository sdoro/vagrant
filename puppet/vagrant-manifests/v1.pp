
include motd

host { 'p1.vagrant.com':
    ensure => 'present',
    target => '/etc/hosts',
    ip => '192.168.222.10',
    host_aliases => ['sx','p1']
}

host { 'p2.vagrant.com':
    ensure => 'present',
    target => '/etc/hosts',
    ip => '192.168.222.11',
    host_aliases => ['dx','p2']
}

file { '/etc/mailname':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    #content => "${hostname}\n",
    content => "${fqdn}\n",
}

