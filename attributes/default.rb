default['percona']['version'] = "0.1-3"
default['percona']['repo']['file'] = "percona-release-#{node['percona']['version']}.noarch.rpm"
default['percona']['repo']['url'] = "http://www.percona.com/downloads/percona-release/redhat/#{node['percona']['version']}/#{node['percona']['repo']['file']}"
default['percona']['mysql']['user'] = "percona"
default['percona']['mysql']['password'] = "percona"
default['percona']['mysql']['root']['user'] = "root"
default['percona']['mysql']['root']['password'] = "root"
