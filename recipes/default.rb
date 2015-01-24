#
# Cookbook Name:: my-app
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install the service

include_recipe 'tomcat'

war = "#{node['tomcat']['webapp_dir']}/#{node['sample-app']['app-name']}.war"
remote_file war do
  source node['sample-app']['url']
end

httpd_service 'default' do
  action [:create, :start]
end
