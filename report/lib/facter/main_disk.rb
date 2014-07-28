Facter.add("main_disk") do
  setcode do
    output = Facter::Util::Resolution.exec('/bin/bash -c \'df -t ext4\'')
    formatArray = output.split()
    formatArray.drop(7)
    value = formatArray.at(5).chomp("%")
  end
end