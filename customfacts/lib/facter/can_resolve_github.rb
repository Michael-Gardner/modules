# can_resolve_github.rb
Facter.add('can_resolve_github') do
  setcode do
     Facter::Util::Resolution.exec('/bin/bash -c \'ping -c 4 github.com; [[ $? == 0 ]] && echo true || echo false\'')
   end
end
