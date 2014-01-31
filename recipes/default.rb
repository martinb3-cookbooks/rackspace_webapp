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

include_recipe 'rackspace_cloudmonitoring'

node.set['rackspace_cloudmonitoring']['monitors'] = {
 'web_check' => {
    'type' => 'remote.http',
    'target_hostname' => "#{node['ipaddress']}",
    'monitoring_zones_poll' => %w[
      'mzdfw',
      'mziad',
      'mzord'
    ],
    'details' => {
      'url' => "http://#{node['ipaddress']}/",
      'method' => 'GET'
    }
  }
}

include_recipe 'rackspace_cloudmonitoring::monitors'
