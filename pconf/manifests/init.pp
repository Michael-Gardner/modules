# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 10, 2014
# License:  GPL v3
#
# See pconf::params for information regarding parameters
#   as well as to set the defaults for your deployment
class pconf 
( $servername           = $pconf::params::servername,
  $environment          = $pconf::params::environment,
  $runinterval          = $pconf::params::runinterval,
  $basemodulepath       = $pconf::params::basemodulepath,
  $autosign             = $pconf::params::autosign,
  $pluginsync           = $pconf::params::pluginsync,
  $report               = $pconf::params::report,
  $reports              = $pconf::params::reports,
  $reporturl            = $pconf::params::reporturl,
  $archive_files        = $pconf::params::archive_files,
  $archive_file_server  = $pconf::params::archive_file_server,
  $log_level            = $pconf::params::log_level,
  $storeconfigs         = $pconf::params::storeconfigs,
  $storeconfigs_backend = $pconf::params::storeconfigs_backend,
) inherits pconf::params {
  file { "puppet.conf":
    path    => "/etc/puppet/puppet.conf",
    ensure  => file,
    content => template("pconf/puppet.conf.erb"),
  }       
}
