# storage_used.rb
Facter.add('storage_used') do
  setcode do
    Facter::Util::Resolution.exec('/bin/bash -c \'ping -c 1 svn.br.seisint.com &> /dev/null; [[ $? == 0 ]] && echo true || echo false\'')
  end
end