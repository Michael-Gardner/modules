class hosts (
  $servername = $host::params::server_name,
  $serverip   = $host::params::server_ip,
) inherits hosts::params 
{
  $_servername = $servername ? {
    undef   => $::servername,
    default => $servername,
  }

  $_serverip = $serverip ? {
    undef   => $::serverip,
    default => $serverip,
  }

  case $::operatingsystem {
    'Ubuntu': { $host_source = "ubuntu.hosts.erb" }
    'CentOS': { $host_source = "centos.hosts.erb" }
  } # end case ::operatingsystem
    
  file { "hosts":
    path    => "/etc/hosts",
    ensure  => file,
    content => template("hosts/${host_source}"),
  }
}
