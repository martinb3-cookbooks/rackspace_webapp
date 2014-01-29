#
# Cookbook Name:: rackspace_webapp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rackspace_memcached"

case node['memcached']['config']['iptables']
when "open"
  port = node['memcached']['config']['port']
  chain = 'INPUT'
  rule = "-p tcp --dport #{port} -j ACCEPT"
  node.set['rackspace_iptables']['config']['chains'][chain][rule]['weight'] = 50
  node.set['rackspace_iptables']['config']['chains'][chain][rule]['comment'] = "open memcached port"
end

include_recipe "rackspace_iptables"
