#
# Cookbook Name:: my-app
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install the service

include_recipe 'tomcat'

httpd_service 'default' do
  action [:create, :start]
end
