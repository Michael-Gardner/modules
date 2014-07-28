# storage_used.rb
def getstoragemetrics
  output_string = Facter::Util::Resolution.exec('/bin/bash -c \'df -t nfs -t ext2 -t ext3 -t ext4\'')
  # split into array and drop the header
  output_array = output_string.split("\n")
end



Facter.add('storage_used') do
  confine :kernel => :linux
  setcode do
    getstoragemetrics
  end
end