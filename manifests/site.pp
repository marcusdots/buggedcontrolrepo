

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
}
