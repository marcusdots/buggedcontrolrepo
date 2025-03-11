class chainloader (
  String $network_class = 'profile::a',
){
  if $network_class && $ network_class != 'disabled' {
    include $network_class
  }
}
