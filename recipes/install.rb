#
# Cookbook Name:: vertx
# Recipe:: install
#
# Author 2013 Sascha Möllering (sascha.moellering@zanox.com)
#

include_recipe "java"
include_recipe "ark"

case node['platform_family']
when "rhel"
  bash "update_rhel" do
  code <<-EOS
    sudo yum -y update
  EOS
end
when "debian"
  
  package "authbind" do
    action :install
  end

  bash "configure_authbind" do
    code <<-EOS
    touch /etc/authbind/byport/80
    chown vertx:vertx /etc/authbind/byport/80
    chmod 755 /etc/authbind/byport/80
    EOS
    not_if {File.exists?("/etc/authbind/byport/80")}
  end
end

ark "vertx" do
  url node[:vertx][:url] + "vert.x-" + node[:vertx][:version] + "-final.zip"
  home_dir node[:vertx][:home]
  version node[:vertx][:version]
  append_env_path true
  action :install
end

bash "configure_vertx" do
  code <<-EOS
  chown -R vertx:vertx /usr/local/vertx-2.0.2
  EOS
end

%w{ logs deploy deploy/packages }.each do |dir|
  directory "/srv/#{dir}" do
    owner "vertx"
    group "vertx"
    recursive true
  end
end

config_vertx="/etc/default/vertx"
config_vertx_deploy="/etc/default/vertx"

case node['platform_family']
when "rhel"
  config_vertx="/etc/sysconfig/vertx"
  config_vertx_deploy="/etc/sysconfig/vertx_deploy"
end

template config_vertx do
  source "vertx_config.erb"
  mode "0644"
  owner "vertx"
  group "vertx"
  not_if {File.exists?(config_vertx)} 
end

template config_vertx_deploy do
  source "vertx_deploy.erb"
  mode "0644"
  owner "vertx"
  group "vertx"
  not_if {File.exists?(config_vertx_deploy)} 
end

template "/etc/init.d/vertx" do
  source "vertx_runlevel.erb"
  mode "0755"
  owner "root"
  group "root"
end

%w{conf bin}.each do |subdir|
  directory "#{node[:vertx][:home]}/#{subdir}" do
    owner "vertx"
    group "vertx"
    recursive true
  end
end

template node[:vertx][:home] + "/conf/jmxremote.access" do
  source "jmxremote.access.erb"
  mode "0600"
  owner "vertx"
  group "vertx"
end

template node[:vertx][:home] + "/conf/jmxremote.password" do
  source "jmxremote.password.erb"
  mode "0600"
  owner "vertx"
  group "vertx"
end

template node[:vertx][:home] + "/conf/cluster.xml" do
  source "cluster_xml.erb"
  mode "0644"
  owner "vertx"
  group "vertx"
end

template node[:vertx][:home] + "/conf/repos.txt" do
  source "repos_txt.erb"
  mode "0644"
  owner "vertx"
  group "vertx"
end

template node[:vertx][:home] + "/conf/logging.properties" do
  source "logging_properties.erb"
  mode "0644"
  owner "vertx"
  group "vertx"
end

template node[:vertx][:home] + "/bin/vertx" do
  source "vertx.erb"
  mode "0755"
  owner "vertx"
  group "vertx"
end

service "vertx" do
  service_name "vertx"
  action [:enable, :start]
end