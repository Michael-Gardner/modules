# cmake_version.rb
Facter.add('cmake_version') do
  setcode do
     Facter::Util::Resolution.exec('/bin/bash -c \'str=$(cmake --version);echo ${str:14}\'')
   end
end
