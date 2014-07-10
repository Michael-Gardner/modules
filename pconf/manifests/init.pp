# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 10, 2014
# License:  GPL v3
#
# See pconf::params for information regarding parameters
#   as well as to set the defaults for your deployment
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
