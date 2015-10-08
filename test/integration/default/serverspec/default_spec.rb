require_relative 'spec_helper'

describe file('/etc/init.d/test') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
