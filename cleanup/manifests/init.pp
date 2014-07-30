# pattern is a required parameter. it is expected to be an array
#     If you don't pass it as an array of regular expressions
#     your life will suffer greatly.  You have been warned.
class cleanup
( $pattern,
  $age       = $cleanup::params::age,
  $directory = $cleanup::params::directory,
) inherits cleanup::params
{
  validate_array($pattern)
  validate_string($age)
  validate_absolute_path($directory)
    
  file { 'cleanup':
    path    => '/usr/local/bin/cleanup.rb',
    ensure  => file,
    owner   => "root",
    group   => "root",
    mode    => "0755",
    content => template('cleanup/cleanup.erb'),
  }
  
  exec { 'cleanup.rb':
    path        => '/usr/local/bin',
    refreshonly => false,
    command     => 'cleanup.rb',
  }

  anchor { cleanup::begin: }
  anchor { cleanup::end: }
  
  if !empty($pattern) {
    Anchor['cleanup::begin']->
      File['cleanup']->
        Exec['cleanup.rb']->
          Anchor['cleanup::end']
  }
}