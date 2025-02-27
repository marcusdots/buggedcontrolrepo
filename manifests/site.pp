node pe.marcus.betadots.training {
  notify{ "Primary": }
  include chrony
}

node /webserv./ {
  notify{ "Webserver": }
}

node default {
  notify{ $trusted['certname']: }
}
