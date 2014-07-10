# cmake_version.rb
Facter.add('hardware_platform') do
  setcode do
     Facter::Util::Resolution.exec('/bin/bash -c \'str=$(cmake --version);echo ${str:14}\'')
   end
end
