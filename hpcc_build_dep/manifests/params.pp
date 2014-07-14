# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 9, 2014
# License:  GPL v3
#
class hpcc_build_dep::params
{
  $cmake_file = 'cmake-2.8.11.tar.gz'

  case $::operatingsystem {
  'Ubuntu': {
    $create_cmake_from_source = false
    case $::operatingsystemrelease {
    '12.04': { $dependency_hash = {
              'g++' => { ensure => present,},
              'gcc' => { ensure => present,}, 
              'make' => { ensure => present,}, 
              'cmake' => { ensure => present,}, 
              'bison' => { ensure => present,},
              'flex' => { ensure => present,},
              'binutils-dev' => { ensure => present,}, 
              'libldap2-dev' => { ensure => present,}, 
              'libcppunit-dev' => { ensure => present,},
              'libicu-dev' => { ensure => present,}, 
              'libxalan110-dev' => { ensure => present,}, 
              'zlib1g-dev' => { ensure => present,},
              'libboost-regex-dev' => { ensure => present,}, 
              'libssl-dev' => { ensure => present,}, 
              'libarchive-dev' => { ensure => present,},
              'python2.7-dev' => { ensure => present,}, 
              'libv8-dev' => { ensure => present,}, 
              'openjdk-6-jdk' => { ensure => present,},
              'libapr1-dev' => { ensure => present,},
              'libaprutil1-dev' => { ensure => present,}, } }
    '13.10': { $dependency_hash = { 
              'g++' => { ensure => present,}, 
              'gcc' => { ensure => present,}, 
              'make' => { ensure => present,}, 
              'cmake' => { ensure => present,}, 
              'bison' => { ensure => present,},
              'flex' => { ensure => present,}, 
              'binutils-dev' => { ensure => present,}, 
              'libldap2-dev' => { ensure => present,}, 
              'libcppunit-dev' => { ensure => present,}, 
              'libicu-dev' => { ensure => present,}, 
              'libxalan-c-dev' => { ensure => present,}, 
              'zlib1g-dev' => { ensure => present,},
              'libboost-regex-dev' => { ensure => present,}, 
              'libssl-dev' => { ensure => present,}, 
              'libarchive-dev' => { ensure => present,}, 
              'python2.7-dev' => { ensure => present,}, 
              'libv8-dev' => { ensure => present,}, 
              'openjdk-6-jdk' => { ensure => present,}, 
              'libapr1-dev' => { ensure => present,}, 
              'libaprutil1-dev' => { ensure => present,}, } }
    '14.04': { $dependency_hash = { 
              'g++' => { ensure => present,}, 
              'gcc' => { ensure => present,}, 
              'make' => { ensure => present,}, 
              'cmake' => { ensure => present,}, 
              'bison' => { ensure => present,}, 
              'flex' => { ensure => present,}, 
              'binutils-dev' => { ensure => present,}, 
              'libldap2-dev' => { ensure => present,}, 
              'libcppunit-dev' => { ensure => present,}, 
              'libicu-dev' => { ensure => present,}, 
              'libxalan-c-dev' => { ensure => present,}, 
              'zlib1g-dev' => { ensure => present,}, 
              'libboost-regex-dev' => { ensure => present,}, 
              'libssl-dev' => { ensure => present,}, 
              'libarchive-dev' => { ensure => present,}, 
              'python2.7-dev' => { ensure => present,}, 
              'libv8-dev' => { ensure => present,}, 
              'openjdk-6-jdk' => { ensure => present,}, 
              'libapr1-dev' => { ensure => present,}, 
              'libaprutil1-dev' => { ensure => present,}, 
              'libiberty-dev' => { ensure => present,}, } }
    default: { fail("No Dependency List: Ubuntu ${::operatingsystemrelease}") }
    } # end case Ubuntu ::operatingsystemrelease
  } # end case Ubuntu
  'CentOS': {
    $create_cmake_from_source = true
    case $::operatingsystemmajrelease {
    '5':     { $dependency_hash = {
                'gcc-c++' => { ensure => present,}, 
                'gcc' => { ensure => present,}, 
                'make' => { ensure => present,}, 
                'bison' => { ensure => present,}, 
                'flex' => { ensure => present,},
                'binutils-devel' => { ensure => present,}, 
                'openldap-devel' => { ensure => present,}, 
                'libicu-devel' => { ensure => present,}, 
                'libxslt-devel' => { ensure => present,}, 
                'libarchive-devel' => { ensure => present,}, 
                'boost-devel' => { ensure => present,}, 
                'openssl-devel' => { ensure => present,}, 
                'apr-devel' => { ensure => present,}, 
                'apr-util-devel' => { ensure => present,}, } }
    '6':     { $dependency_hash = { 
                'gcc-c++' => { ensure => present,}, 
                'gcc' => { ensure => present,}, 
                'make' => { ensure => present,}, 
                'bison' => { ensure => present,}, 
                'flex' => { ensure => present,},
                'binutils-devel' => { ensure => present,}, 
                'openldap-devel' => { ensure => present,}, 
                'libicu-devel' => { ensure => present,}, 
                'libxslt-devel' => { ensure => present,}, 
                'libarchive-devel' => { ensure => present,}, 
                'boost-devel' => { ensure => present,}, 
                'openssl-devel' => { ensure => present,}, 
                'apr-devel' => { ensure => present,}, 
                'apr-util-devel' => { ensure => present,}, } }
    default: {fail("No Dependency List: CentOS ${::operatingsystemmajrelease}")}
    } # end case CentOS ::operatingsystemmajrelease
  } # end case CentOS
  default:  { fail('Unsupported Operating System for HPCC build dependencies') }
  } # end case ::operatingsystem
}
