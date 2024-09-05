plan plandemo::mynotify {
  notice('find me in the log')
  $tgt = lookup('myplan', first, undef)
  run_plan($tgt)
}
