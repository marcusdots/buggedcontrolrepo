class company::grub(
#kernel_parameter { "quiet":
#  ensure   => present,
#  bootmode => "recovery",
  Hash $config = {},
){
  notify{ 'Grub Config Einstellungen werden geladen':}
  $config.each |$key, $val| {
    grub_config { $key:
      * => $val,
    }
  }
}
