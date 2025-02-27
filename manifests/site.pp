node pe.marcus.betadots.training {
  notify{ "Primary": }
}

node default {
  notify{ $trusted['certname']: }
}
