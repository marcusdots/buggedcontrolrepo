plan plandemo::mynotify {
  notice('find me in the log')
  $tgt = lookup('myplan', String, 'first', undef)
  run_plan($tgt)
  run_plan(undef)
}
