name              'mysql-chef_gem'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@getchef.com'
license           'Apache 2.0'
description       'Provides the mysql_chef_gem resource'

version           '0.0.2'

supports          'amazon'
supports          'redhat'
supports          'centos'
supports          'scientific'
supports          'fedora'
supports          'debian'
supports          'ubuntu'
supports          'smartos'
# supports          'omnios'

depends           'build-essential'
depends           'mysql'