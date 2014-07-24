class report
( $github = $report::params::github,
) inherits report::params
{
  $_github = str2bool($github)

  if ( !$_github ) {
    err("github is unreachable from this node")
  }
}
