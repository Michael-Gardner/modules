hostclass :cleanupclass, :cleanup do
  output = Facter::Util::Resolution.exec('ls -la /var/lib/jenkins/workspace')
  puts output  
end
