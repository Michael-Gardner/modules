# resolve_github.rb
Facter.add('resolve_github') do
  setcode do
     Facter::Util::Resolution.exec('/bin/bash -c \'ping -c 1 github.com &> /dev/null; [[ $? == 0 ]] && echo true || echo false\'')
   end
end