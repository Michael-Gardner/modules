class pconf
( $servername     = $pconf::params::servername,
  $environment    = $pconf::params::environment,
  $runinterval    = $pconf::params::runinterval,
  $basemodulepath = $pconf::params::basemodulepath,
  $autosign       = $pconf::params::autosign,
) inherits pconf::params {
  file { "puppet.conf":
    path    => "/etc/puppet/puppet.conf",
    ensure  => file,
    content => template("pconf/puppet.conf.erb"),
  }       
}
