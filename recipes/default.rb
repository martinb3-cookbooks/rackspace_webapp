# encoding: utf-8
#
# Cookbook Name:: rackspace_webapp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'rackspace_memcached'
include_recipe 'rackspace_iptables'

case node['memcached']['config']['iptables']
when 'open'
  port = node['memcached']['config']['port']
  chain = 'INPUT'
  rule = "-p tcp --dport #{port} -j ACCEPT"
  add_iptables_rule(chain, rule)
end

log node['rackspace_iptables']['config']['chains']
