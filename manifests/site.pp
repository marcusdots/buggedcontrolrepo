

notify { 'site.pp-foo':
  require => Notify['site.pp-123'],
}

notify { 'site.pp-123':
}

include mpo_a
include mpo_e
