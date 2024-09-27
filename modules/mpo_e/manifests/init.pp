class mpo_e(){
  notify{ 'Klasse E geladen':}
  include mpo_f
  include mpo_g
  Class['mpo_f']->Class['mpo_g']
}
