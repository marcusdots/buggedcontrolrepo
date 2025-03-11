node puppet.mpopub1.int.betadots.training {
  notify{ "Primary": }
  include chrony
  include chainloader
}

node /webserv./ {
  notify{ "Webserver": }
  include profile::a
  include chainloader
}

node default {
  notify{ $trusted['certname']: }
  include chainloader  
}
