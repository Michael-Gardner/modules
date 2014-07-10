# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
class hpcc_build_dep (
  $dependency_list = $hpcc_build_dep::params::dependency_list,
  $cmake_src       = $hpcc_build_dep::params::cmake_src,
) inherits hpcc_build_dep::params
{
  

  package { $dependency_list :
    ensure => present,
  }

  if ( $cmake_src ) {

  }
}
