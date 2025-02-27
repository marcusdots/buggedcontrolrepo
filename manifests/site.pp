node pe.marcus.betadots.training {
  notify{ "Primary": }
}

node /webserv./ {
  notify{ "Webserver": }
}

node default {
  notify{ $trusted['certname']: }
}
