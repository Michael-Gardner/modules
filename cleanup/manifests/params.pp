# age is in the same format as tidy, m(inute), h(our),
#     d(ay) and w(eek) postfixes are acceptable, with 
#     a leading integer (no space) that acts as a scalar
# directory is the base location to clean from
class cleanup::params
{
  $age        = '1w'
  $directory  = '/var/lib/jenkins/workspace'
  $cronminute = [0]
  $cronhour   = [6,18]
}