plan plandemo::mynotify {
  notice('find me in the log')
  $tgt1 = lookup('myplan', String, 'first', undef)
  run_plan($tgt1)
  $tgt2 = lookup('does_not_exist', String, 'first', 'plandemo::noop')
  run_plan($tgt2)
}

plan plandemo::noop {
}
