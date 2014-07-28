# storage_used.rb
output_string = Facter::Util::Resolution.exec('/bin/bash -c \'df -t nfs -t ext2 -t ext3 -t ext4\'')
# split into array and drop the header
output_array = output_string.split()
output_array.drop(7)
device = Array.new
pused  = Array.new
until output_array.empty? do
  device.push(output_array.at(1).to_s)
  pused.push(output_array.at(5).to_s)
  output_array.drop(6)
end

i = device.size
while i > 0 do
  Facter.add(device.at(i).to_s) do
    setcode do
      pused.at(i).to_s
    end
  end
  i -= 1
end
