class networkmanager
( $ensure = $networkmanager::params::ensure,
  $enable = $networkmanager::params::enable,
) inherits networkmanager::params
{
  validate_bool($enable)
  validate_string($ensure)

  if ( $::operatingsystem == 'CentOS' ) {
    service { 'NetworkManager':
      ensure => $ensure,
      enable => $enable,
    }
  }
}
