# storage_used.rb
def getstoragemetrics
  output_string = Facter::Util::Resolution.exec('/bin/bash -c \'df -t nfs -t ext2 -t ext3 -t ext4\'')
  # split into array and drop the header
  output_array = output_string.split("\n")
  output_array.drop(1)
  device = []
  pused = []
  until output_array.empty? do
    devices.push(output_array.at(1))
    pused.push(output_array.at(5))
    output_array.drop(6)
  end
end



Facter.add('storage_used') do
  confine :kernel => :linux
  setcode do
    getstoragemetrics
  end
end