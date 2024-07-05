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
