# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
class hpcc_build_dep (
  $dependency_hash          = $hpcc_build_dep::params::dependency_hash,
  $create_cmake_from_source = $hpcc_build_dep::params::create_cmake_from_source,
  $cmake_file               = $hpcc_build_dep::params::cmake_file,
) inherits hpcc_build_dep::params
{
  validate_hash($dependency_hash)
  validate_string($cmake_file)
  validate_bool($create_cmake_from_source)

  create_resources(package, $dependency_hash)

  if ( $create_cmake_from_source ) {

    $source_dir    = regsubst($cmake_file, '.tar.gz','')
    $cmake_version = regsubst($source_dir, 'cmake-','')

    file { 'cmake source':
      ensure => file,
      path   => "/tmp/${cmake_file}",
      source => "puppet:///modules/hpcc_build_dep/${cmake_file}",
    }

    exec { 'cmake bootstrap and install':
      cwd         => '/tmp/',
      path        => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
      command     => "tar -zxf ${cmake_file};cd ${source_dir};./bootstrap;make;make install",
      refreshonly => true,
      require     => [Package['make'], Package['gcc']], 
      timeout     => '500',
    }
    if ( $::cmake_version != $cmake_version ) { 
      File['cmake source'] ~>
        Exec['cmake bootstrap and install']
    }
  }
}
