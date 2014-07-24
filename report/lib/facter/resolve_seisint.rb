# resolve_seisint.rb
Facter.add('resolve_seisint') do
  setcode do
     Facter::Util::Resolution.exec('/bin/bash -c \'ping -c 1 svn.br.seisint.com &> /dev/null; [[ $? == 0 ]] && echo true || echo false\'')
   end
end