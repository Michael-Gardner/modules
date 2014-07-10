# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
class hpcc_build_dep (
  $dependency_hash = $hpcc_build_dep::params::dependency_hash,
) inherits hpcc_build_dep::params
{
  package {
    
    ensure => present,
  }



}
