# ../report/lib/puppet/reports/github.rb
require 'puppet'

Puppet::Reports.register_report(:github) do
  desc "Process the github errors on our agent machines"
  
  def process
    
    my_api.post(self.to_yaml)
  end
end