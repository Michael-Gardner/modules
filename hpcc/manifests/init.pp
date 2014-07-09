class hpcc 
inherits hpcc::params 
( $
  $
  $
{

  if $ruby   { include ruby }
  if $python { include python }
  if $r_lang { include r_lang }
  if $java   { include java }

  class { "hpcc::install":
  }
}
