#
# Cookbook Name:: node-deployment_support
# Recipe:: npmservice
#
# Description: This recipe is used to control a node application using npm
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/init.d/#{node['node-deployment']['name']}" do
  source 'npm-app-init.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :user => node['node-deployment']['user'],
    :node_application => node['node-deployment']['name'],
    :npm_application => node['node-deployment']['npm_application'],
    :app_root_directory => node['node-deployment']['app_root_directory'],
    :start_command => node['node-deployment']['start_command'],
    :stop_command => node['node-deployment']['stop_command']
  )
end

service node['node-deployment']['name'] do
  action [:enable, :start]
end
