# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
# pattern
#   require argument, can take a glob w/ regular expressions
# dirpath
#   optional, or can be set in params
#
class dd
( $pattern,
  $dirpath = $dd::params::dirpath,
) inherits dd::params {
  tidy { 'cleanup':
    path    => $dirpath,
    rmdirs  => true,
    recurse => true,
    matches => $pattern,
  }
}
