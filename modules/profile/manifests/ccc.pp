class profile::ccc (
  String $param = 'defaultwert',
) {

  notify { "Hallo Welt, ich bin ${param}":
  }
}
