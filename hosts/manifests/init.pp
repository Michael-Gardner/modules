# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
# see hosts::params for parameter description
#
class hosts (
  $servername  = $hosts::params::servername,
  $serverip    = $hosts::params::serverip,
  $host_source = $hosts::params::host_source,
) inherits hosts::params 
{   
  file { "hosts":
    path    => "/etc/hosts",
    ensure  => file,
    content => template("hosts/${host_source}"),
  }
}
