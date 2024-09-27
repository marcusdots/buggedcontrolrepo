

notify { 'site.pp-foo':
  require => Notify['site.pp-123'],
}

notify { 'site.pp-123':
}

include a
include e
