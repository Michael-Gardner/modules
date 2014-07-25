# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
# dirpath
#   optional, or can be set in params
#
class dd
( $age     = $dd::params::age,
  $dirpath = $dd::params::dirpath,
) inherits dd::params {
  tidy { 'cleanup':
    path    => $dirpath,
    rmdirs  => true,
    recurse => true,
    age     => $age,
  }
}
