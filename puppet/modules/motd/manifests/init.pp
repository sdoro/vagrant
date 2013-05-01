class motd {
  file { "/etc/motd":
    owner => "root",
    group => "root",
    mode => 644,
    content => template("motd/generic_motd.erb"),
  }
}
