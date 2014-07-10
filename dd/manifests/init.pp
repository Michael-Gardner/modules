# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
class dd
( $pattern,
  $dirpath = $dd::params,
) inherits dd::params {
  tidy { 'jenkins cleanup':
    path    => $dirpath,
    rmdirs  => true,
    recurse => true,
    matches => $pattern,
  }
}
