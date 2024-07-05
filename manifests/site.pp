file_line{ 'foo':
  path    => '/tmp/hostnamen.txt',
  content => $facts['networking']['hostname'],
}
