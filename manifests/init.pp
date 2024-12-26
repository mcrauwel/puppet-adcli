# == Class: adcli
#
# Installs the adcli package and Joins Active Directory using adcli.
#
# === Parameters
#
# [*ad_domain*]
#   Active Directory domain to join using adcli.
#   Required: true
#   Default: undef
#
# [*ad_join_username*]
#   Username to use during AD join operation.
#   Required: true
#   Default: undef
#
# [*ad_join_password*]
#   Password to use during AD join operation.
#   Required: true
#   Default: undef
#
# [*ad_join_ou*]
#   OU to use for computer account creation during AD join operation.
#   Required: true
#   Default: undef
#
# === Examples
#
# class {'::adcli':
#   ad_domain        => 'ad.example.com',
#   ad_join_username => 'username',
#   ad_join_password => 'secret',
#   ad_join_ou       => 'ou=container,dc=example,dc=com'
# }
#
# === Authors
#
# Aaron Johnson <acjohnson@pcdomain.com>
#
# === Copyright
#
# Copyright 2016 Aaron Johnson
#
class adcli (
  String $ad_domain                           = $adcli::params::ad_domain,
  String $ad_join_username                    = $adcli::params::ad_join_username,
  String $ad_join_password                    = $adcli::params::ad_join_password,
  String $ad_join_ou                          = $adcli::params::ad_join_ou,
  Optional[String] $ad_join_domain_controller = $adcli::params::ad_join_domain_controller,
  Array[String] $ad_join_service_names        = $adcli::params::ad_join_service_names,
  Optional[String] $ad_join_computer_name     = $adcli::params::ad_join_computer_name,
  Optional[String] $ad_join_os                = $adcli::params::ad_join_os,
  Optional[String] $ad_join_os_version        = $adcli::params::ad_join_os_version,
  Optional[String] $ad_join_os_service_pack   = $adcli::params::ad_join_os_service_pack,
) inherits adcli::params {

  anchor { 'adcli::begin': }
  -> class { '::adcli::install': }
  -> class { '::adcli::join': }
  -> anchor { 'adcli::end': }

}
