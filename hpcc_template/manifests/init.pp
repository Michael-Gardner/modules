class hpcc_package_template (
  $package_hash = $hpcc_template::params::package_hash,
) inherits hpcc_template::params 
{  
  validate_hash($package_hash)
  create_resources(package, $package_hash)
}
