# Author:   Michael Jon Gardner
# Email:    vintage910@hotmail.com
# Date:     July 10, 2014
# License:  GPL v3
#
# servername
#   the fully qualified domain name of your puppet master
#   the default will pull fqdn of server serving up manifest
#
# environment
#   name of environment in which we want our nodes to belong
#
# runinterval
#   time between agent -> master queries
#   this can be in a 'Xm' format for minutes or 'Xh' format
#   for hours
#
# basemodulepath
#   the path to our module library to be shared across all
#   of our different environments
#
# autosign
#   [master] setting for autosigning all of our certs
#   ensure that you have an auth.conf file under $confdir
#   that has the appropriate whitelist settings
class pconf::params
{
  $servername     = $::servername 
  $environment    = 'production'
  $runinterval    = '30m'
  $basemodulepath = '/usr/share/puppet/modules'
  $autosign       = 'false'
  $pluginsync     = 'true'
  $report         = 'true'
  $reports        = 'store, http'
  $reporturl      = "http://${::servername}:3000/reports"
}
