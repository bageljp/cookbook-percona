#
# Cookbook Name:: percona
# Recipe:: default
#
# Copyright 2015, bageljp
#
# All rights reserved - Do Not Redistribute
#

case node["platform_family"]
when "rhel"
  remote_file "/usr/local/src/#{node['percona']['repo']['file']}" do
    owner "root"
    group "root"
    mode 00644
    source "#{node['percona']['repo']['url']}"
  end

  package "percona-release" do
    action :install
    provider Chef::Provider::Package::Rpm
    source "/usr/local/src/#{node['percona']['repo']['file']}"
  end
end

