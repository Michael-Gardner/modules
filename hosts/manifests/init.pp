# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
# see hosts::params for parameter description
#
class hosts (
  $servername     = $hosts::params::servername,
  $serverip       = $hosts::params::serverip,
  $host_source    = $hosts::params::host_source,
  $external_nodes = $hosts::params::external_nodes,
) inherits hosts::params 
{
  validate_hash($external_nodes)
  validate_string($servername)
  validate_string($serverip)
  validate_string($host_source)
   
  file { "hosts":
    path    => "/etc/hosts",
    ensure  => file,
    content => template("hosts/${host_source}"),
  }
}
