#
# Cookbook Name:: apache2_moja
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/var/www/moja' do
  owner node['apache']['user']
  group node['apache']['gruop']
  mode 00755
  recursive true
end

web_app 'moja' do
  server_name node['ipaddress']
  server_aliases [node['fqdn'], node['ipaddress']]
  docroot '/var/www/moja'
  notifies :restart, 'service[apache2]'
end
