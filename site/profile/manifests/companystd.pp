class profile::companystd (
  $greeting = undef
){
  notify{ 'Welcome to Great-Corp!':}
  if $greeting {
    notify{ $greeting: }
  }
}
