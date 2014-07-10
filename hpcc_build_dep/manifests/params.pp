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
    '12.04': { $dependency_list = [ 'g++', 'gcc', 'make', 'cmake', 'bison',
              'flex', 'binutils-dev', 'libldap2-dev', 'libcppunit-dev',
              'libicu-dev', 'libxalan110-dev', 'zlib1g-dev',
              'libboost-regex-dev', 'libssl-dev', 'libarchive-dev',
              'python2.7-dev', 'libv8-dev', 'openjdk-6-jdk','libapr1-dev',
              'libaprutil1-dev' ] }
    '13.10': { $dependency_list = [ 'g++', 'gcc', 'make', 'cmake', 'bison',
              'flex', 'binutils-dev', 'libldap2-dev', 'libcppunit-dev', 
              'libicu-dev', 'libxalan-c-dev', 'zlib1g-dev',
              'libboost-regex-dev', 'libssl-dev', 'libarchive-dev', 
              'python2.7-dev', 'libv8-dev', 'openjdk-6-jdk', 'libapr1-dev', 
              'libaprutil1-dev' ] }
    '14.04': { $dependency_list = [ 'g++', 'gcc', 'make', 'cmake', 'bison', 
              'flex', 'binutils-dev', 'libldap2-dev', 'libcppunit-dev', 
              'libicu-dev', 'libxalan-c-dev', 'zlib1g-dev', 
              'libboost-regex-dev', 'libssl-dev', 'libarchive-dev', 
              'python2.7-dev', 'libv8-dev', 'openjdk-6-jdk', 'libapr1-dev', 
              'libaprutil1-dev', 'libiberty-dev' ] }
    default: { fail("No Dependency List: Ubuntu ${::operatingsystemrelease}") }
    } # end case Ubuntu ::operatingsystemrelease
  } # end case Ubuntu
  'CentOS': {
    $create_cmake_from_source = true
    case $::operatingsystemmajrelease {
    '5':     { $dependency_list = [ 'gcc-c++', 'gcc', 'make', 'bison', 'flex',
                'binutils-devel', 'openldap-devel', 'libicu-devel', 
                'libxslt-devel', 'libarchive-devel', 'boost-devel', 
                'openssl-devel', 'apr-devel', 'apr-util-devel' ] }
    '6':     { $dependency_list = [ 'gcc-c++', 'gcc', 'make', 'bison', 'flex',
                'binutils-devel', 'openldap-devel', 'libicu-devel', 
                'libxslt-devel', 'libarchive-devel', 'boost-devel', 
                'openssl-devel', 'apr-devel', 'apr-util-devel' ] }
    default: {fail("No Dependency List: CentOS ${::operatingsystemmajrelease}")}
    } # end case CentOS ::operatingsystemmajrelease
  } # end case CentOS
  default:  { fail('Unsupported Operating System for HPCC build dependencies') }
  } # end case ::operatingsystem
}
