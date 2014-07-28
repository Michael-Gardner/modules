## storage_used.rb
#output_string = Facter::Util::Resolution.exec('/bin/bash -c \'df -t nfs -t ext2 -t ext3 -t ext4\'')
## split into array and drop the header
#output_array = output_string.split()
#output_array.drop(7)
#dhash = Hash.new
#while output_array.size > 0
#  dhash[output_array.at(1).to_s] = output_array.at(5).to_s
#  output_array.drop(6)
#end
#
#dhash.each do |key, value|
#  Facter.add(key) do
#    setcode value
#  end
#end