#
# Cookbook Name:: vertx
# Recipe:: user
#
# Author 2013 Sascha Möllering (sascha.moellering@zanox.com)
#

group "vertx" do
  gid 1009
end

user "vertx" do
  comment "runtime user vertx"
  uid 1009
  gid "vertx"
  home "/home/vertx"
  supports :manage_home => true
end
