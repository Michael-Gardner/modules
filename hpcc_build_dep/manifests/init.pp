# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
class hpcc_build_dep (
  $dependency_list          = $hpcc_build_dep::params::dependency_list,
  $create_cmake_from_source = $hpcc_build_dep::params::create_cmake_from_source,
  $cmake_file               = $hpcc_build_dep::params::cmake_file,
) inherits hpcc_build_dep::params
{
  validate_array($dependency_list)
  validate_string($cmake_file)
  validate_bool($create_cmake_from_source)

  package { $dependency_list :
    ensure => present,
  }

  if ( $create_cmake_from_source ) {

    $source_dir = regsubst($cmake_file, '.tar.gz','')

    file { 'cmake source':
      ensure => file,
      path   => "/tmp/${cmake_file}",
      source => "puppet:///modules/hpcc_build_dep/${cmake_file}",
    }
    
    exec { 'check cmake version':
      path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
      command => 'bash -c \'STR=$(cmake --verson);NSTR=${STR:0:5}-${STR:14};test \'$NSTR\' != \'"${source_dir}"\'\'',
    }

    exec { 'cmake bootstrap and install':
      cwd         => '/tmp/',
      path        => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
      command     => "tar -zxf ${cmake_file};cd ${source_dir};./bootstrap;make;make install",
      refreshonly => true,
      require     => [Package['make'], Package['gcc']], 
      timeout     => '500',
    }
     
    Exec['check cmake version'] ->
      File['cmake source'] ~>
        Exec['cmake bootstrap and install']
  }
}
