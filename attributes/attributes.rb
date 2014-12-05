#
# Cookbook Name:: vertx 
# Attributes:: default
#
# Author 2013 Sascha Möllering (sascha.moellering@zanox.com)
# 

default[:vertx][:version]       = '2.1.5'
default[:vertx][:url]           = 'https://bintray.com/artifact/download/vertx/downloads/vert.x-2.1.5.tar.gz'
default[:vertx][:home]          = '/srv/vertx'
default[:vertx][:module]        = ''
default[:vertx][:pid_file]      = '/var/run/vertx.pid'
default[:vertx][:status_file]   = '/var/www/monitor/status.txt'
default[:vertx][:log_dir]       = '/srv/log/'
default[:vertx][:jmx_password]  = 'change_me_please'