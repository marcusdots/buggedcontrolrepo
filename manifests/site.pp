

file_line{ 'foo':
  path => '/tmp/hostnamen.txt',
  line => $facts['networking']['hostname'],
}

@@file_line{ $facts['networking']['hostname']:
  path => '/tmp/hostnamen_collector.txt',
  line => $facts['networking']['hostname'],
  tag  => 'kleine_kollekte',
}

File_line <<| tag == 'kleine_kollekte' |>>

$query = "inventory[certname] { }"
$nodes = puppetdb_query($query).map |$value| { $value["certname"] }
notify { $nodes: }
notify { 'foo':
  message => puppetdb_query($query),
} 

include foo

node_group { 'All Environments':
  ensure               => 'present',
  description          => 'Environment group parent and default',
  environment          => 'agent-specified',
  override_environment => 'true',
  parent               => 'All Nodes',
  provider             => 'https',
  rule                 => ['and',
  ['~', 'name', '.*']],
}


file { '/tmp/audit':
  ensure => file,
  audit  => all,
  tag    => 'easypeasy',
}

file { '/etc/ssh/root_auth_keys':
  source   => [
    "puppet:///modules/ssh/${trusted['certname']}_root.keys",
    "puppet:///modules/ssh/${trusted['extensions']['pp_application']}_root.keys",
    "file:///absurd",
    "file:///langes",
    "file:///array",
    "file:///tmp/default.txt",
  ],
  loglevel => emerg
}
