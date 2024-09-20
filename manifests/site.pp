
notify { 'foo':
  require => Notify['123'],
}

notify { '123':
  require => Notify['foo'],
}
