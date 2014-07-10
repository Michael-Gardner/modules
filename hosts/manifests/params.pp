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

  case $::operatingsystem {
    'Ubuntu': { $host_source = "ubuntu.hosts.erb" }
    'CentOS': { $host_source = "centos.hosts.erb" }
  } # end case ::operatingsystem
}
