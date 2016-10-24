# == Class: pi
#
# Full description of class pi here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'pi':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class homebridgepi {
  class { 'nodejs':
    repo_url_suffix => '6.x',
  }

  package {
    'git':
      ensure => 'latest',
      provider => 'apt',
      require => [Class['apt']];
    'libavahi-compat-libdnssd-dev':
      ensure => 'latest',
      provider => 'apt',
      require => [Class['apt']];
    'make':
      ensure => 'latest',
      provider => 'apt',
      require => [Class['apt']];
    'homebridge':
      ensure  => 'latest',
      provider => 'npm',
      require => [Package['git', 'libavahi-compat-libdnssd-dev', 'make'],Class['nodejs'],File['homebridge.service','homebridge']];
  }

  file {
    'homebridge.service':
      path   => '/etc/systemd/system/homebridge.service',
      ensure => 'present',
      source => ['/etc/puppet/modules/homebridgepi/files/etc/systemd/system/homebridge.service' , 'puppet:///modules/homebridgepi/etc/systemd/system/homebridge.service'];
    'homebridge':
      path   => '/etc/default/homebridge',
      ensure => 'present',
      source => ['/etc/puppet/modules/homebridgepi/files/etc/default/homebridge', 'puppet:///modules/homebridgepi/etc/default/homebridge'];
  }

  service {
    'homebridge':
      enable => true,
      ensure => 'running',
      require => [Package['homebridge']];
  }
}
