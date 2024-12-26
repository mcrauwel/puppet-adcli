# == Class: adcli::params
#
# Default paramater values for puppet-adcli module
#
# See README.md for more details
#
class adcli::params {

  # ----------------------------------------------------------------------------
  #  Parameters :: adcli
  # ----------------------------------------------------------------------------

  $ad_domain                 = undef
  $ad_join_username          = undef
  $ad_join_password          = undef
  $ad_join_ou                = undef
  $ad_join_domain_controller = undef
  $ad_join_service_names     = []
  $ad_join_computer_name     = undef
  $ad_join_os                = undef
  $ad_join_os_version        = undef
  $ad_join_os_service_pack   = undef


  if $facts['os']['family'] == 'RedHat' and $facts['os']['release']['major'] < '6' {
    fail("Unsupported platform: puppet-adcli does not currently support RedHat ${::operatingsystemmajrelease}")
  }
}
