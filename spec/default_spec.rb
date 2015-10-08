# encoding: utf-8

require 'chefspec'
require 'spec_helper'

describe 'node-deployment_support::service' do
  before do
    stub_command("/usr/sbin/httpd -t").and_return(true)
    stub_command("which sudo").and_return(true)
    stub_data_bag_item('users', 'test').and_return({id: "test", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'fhanson').and_return({id: "fhanson", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'rgindes').and_return({id: "rgindes", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'jneves').and_return({id: "jneves", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'jcrawford').and_return({id: "jcrawford", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'blieberman').and_return({id: "blieberman", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'akemner').and_return({id: "akemner", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'rabdill').and_return({id: "rabdill", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('users', 'nessus').and_return({id: "nessus", team: "test", ssh_keys: "derp_key", administrator: "true", group: "test" })
    stub_data_bag_item('workflow', 'credentials').and_return({id: "credentials", username: "workflowExample", password: "workflowPassword"})
  end
  context 'centos' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['node-deployment']['name'] = 'test'
      end.converge(described_recipe)
    end

    it 'creates template /etc/init.d/test' do
      expect(chef_run).to create_template('/etc/init.d/test')
    end

    it 'enables service test' do
      expect(chef_run).to enable_service('test')
    end

    it 'starts service test' do
      expect(chef_run).to start_service('test')
    end

  end
end

