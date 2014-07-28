# storage_used.rb
output_string = Facter::Util::Resolution.exec('/bin/bash -c \'df -t nfs -t ext2 -t ext3 -t ext4\'')
# split into array and drop the header
output_array = output_string.split("\n")
output_array.drop(1)
dHash = {}
until output_array.empty? do
  key = output_array.at(1)
  val = output_array.at(5)
  dHash[key] = val
  output_array.drop(6)
end
  
dHash.each do |key, value|
  Facter.add("drive_" + key) do
    setcode do
      value
    end
  end
end
