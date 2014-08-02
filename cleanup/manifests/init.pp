# pattern is a required parameter. it is expected to be an array
#     If you don't pass it as an array of regular expressions
#     your life will suffer greatly.  You have been warned.
class cleanup
( $pattern,
  $age        = $cleanup::params::age,
  $directory  = $cleanup::params::directory,
  $cronminute = $cleanup::params::cronminute,
  $cronhour   = $cleanup::params::cronhour,
) inherits cleanup::params
{
  validate_array($pattern,$cronminute,$cronhour)
  validate_string($age)
  validate_absolute_path($directory)
  
  unless empty($pattern) {  
    file { 'cleanup':
      path    => '/usr/local/bin/cleanup.rb',
      ensure  => file,
      owner   => "root",
      group   => "root",
      mode    => "0755",
      content => template('cleanup/cleanup.erb'),
    }
    
    cron { 'cleanup.rb':
      ensure  => present,
      command => '/usr/local/bin/cleanup.rb',
      user    => root,
      minute  => $cronminute,
      hour    => $cronhour,
    }
    
    anchor { cleanup::begin: }
    anchor { cleanup::end: }
  
    info("Running cleanup script on ${directory}")

    Anchor['cleanup::begin']->
      File['cleanup']->
        Exec['cleanup.rb']->
          Anchor['cleanup::end']
  }
}