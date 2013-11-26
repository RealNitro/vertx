#
# Cookbook Name:: vertx 
# Attributes:: default
#
# Author 2013 Sascha Möllering (sascha.moellering@zanox.com)
# 

default[:vertx][:version]    = '2.0.2'
default[:vertx][:home]       = '/srv/vertx'
default[:vertx][:url]        = 'http://dl.bintray.com/vertx/downloads/'

node.override[:java][:jdk_version] = '7'
node.override[:java][:install_flavor] = "oracle"
node.override[:java][:oracle][:accept_oracle_download_terms] = true