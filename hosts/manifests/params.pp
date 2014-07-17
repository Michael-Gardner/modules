# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
# servername
#   default is the fqdn of server creating manifest
#
# serverip
#   default is the ip of server creating manifest
class hosts::params
{
  $servername = $::servername
  $serverip   = $::serverip
  $external_nodes = {
    one => {
      'hostname'  => 'daily-build-centos-6',
      'ipaddress' => '10.176.32.17', 
    },
  }
  case $::operatingsystem {
    'Ubuntu': { $host_source = "ubuntu.hosts.erb" }
    'CentOS': { $host_source = "centos.hosts.erb" }
    default:  { fail("could not define opearting system") }
  } # end case ::operatingsystem
}
