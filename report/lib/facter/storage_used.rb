# storage_used.rb
def getstoragemetrics
  output = Facter::Util::Resolution.exec('/bin/bash -c \'df -t nfs -t ext2 -t ext3 -t ext4\'')
  output = output.lines
  for element in output
    puts element
  end
end



Facter.add('storage_used') do
  setcode do
    getstoragemetrics
  end
end