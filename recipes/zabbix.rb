#
# Cookbook Name:: percona
# Recipe:: zabbix
#
# Copyright 2015, bageljp
#
# All rights reserved - Do Not Redistribute
#

include_recipe "percona"

package "percona-zabbix-templates"

remote_file "/etc/zabbix/zabbix_agentd.d/userparameter_percona_mysql.conf" do
  owner "root"
  group "root"
  mode 00644
  source "file:///var/lib/zabbix/percona/templates/userparameter_percona_mysql.conf"
  notifies :restart, "service[zabbix-agent]"
end

template "/var/lib/zabbix/percona/scripts/ss_get_mysql_stats.php.cnf" do
  owner "root"
  group "root"
  mode 00644
end


script "create user" do
  user "root"
  group "root"
  code <<-EOC
    mysql -u #{node['percona']['mysql']['root']['user']} -p#{node['percona']['mysql']['root']['password']} << EOF
      GRANT SELECT, PROCESS, SUPER ON *.* TO '#{node['percona']['mysql']['user']}'@'localhost' identified by '#{node['percona']['mysql']['password']}';
      FLUSH PRIVILEGES;
EOF
  EOC
  only_if "mysql -u #{node['percona']['mysql']['root']['user']} -p#{node['percona']['mysql']['root']['password']} -e \"select user,host from mysql.user;\" | grep -q localhost | grep -q #{node['percona']['mysql']['user']}"
end
