class mpo_e(){
  notify{ 'Klasse A geladen':}
  include mpo_f
  include mpo_g
  Class['mpo_f']->Class['mpo_g']
}
