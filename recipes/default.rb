#
# Cookbook Name:: my-app
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install the service

include_recipe 'java'

node.default['tomcat']['ssl_port'] = nil
include_recipe 'tomcat'

war = "#{node['tomcat']['webapp_dir']}/#{node['sample-app']['app-name']}.war"
remote_file war do
  source node['sample-app']['url']
end

%w(proxy proxy_ajp).each do |apache_module|
  httpd_module apache_module do
    action :create
  end
end

httpd_config node['sample-app']['app-name'] do
  source "#{node['sample-app']['app-name']}.conf.erb"
  action :create
end

httpd_service 'default' do
  action [:create, :start]
end
