node puppet.mpopub1.int.betadots.training {
  notify{ "Primary": }
  include chrony
}

node /webserv./ {
  notify{ "Webserver": }
  include profile::a
}

node default {
  notify{ $trusted['certname']: }
}
