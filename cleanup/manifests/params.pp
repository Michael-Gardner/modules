# age is in the same format as tidy, m(inute), h(our),
#     d(ay) and w(eek) postfixes are acceptable, with 
#     a leading integer (no space) that acts as a scalar
# directory is the base location to clean from
# cronminute is an array of integers that will fill the crontab
# cronhour is an array of hours we want our cronjob to run our script at
#   take note that all our servers are on UTC time, so subtract 4 from 
#   your desired time, and ensure they're in a 24 hour format
class cleanup::params
{
  $age        = '1w'
  $directory  = '/var/lib/jenkins/workspace'
  $cronminute = [0]
  $cronhour   = [2,14]
}