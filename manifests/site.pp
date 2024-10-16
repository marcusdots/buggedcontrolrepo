
# vcsrepo-once-versuche

vcsrepo { '/root/github.com/bugged_ctl_repo':
  provider => git,
  source   => 'https://github.com/marcusdots/buggedcontrolrepo.git',
  revision => 'vcsrepo_interval',
}

schedule {'myhourly':
  period => hourly,
}

notify {'Sometimes you picture me':
  schedule => 'myhourly',
 }
