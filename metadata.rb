# encoding: utf-8
name             'rackspace_webapp'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures rackspace_webapp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'rackspace_memcached'
depends 'rackspace_iptables'
depends 'rackspace_cloudmonitoring'
