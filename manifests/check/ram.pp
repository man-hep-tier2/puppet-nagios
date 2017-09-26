class nagios::check::ram (
  $ensure                   = undef,
  $args                     = '',
  $check_title              = $::nagios::client::host_name,
  $servicegroups            = undef,
  $check_period             = $::nagios::client::service_check_period,
  $contact_groups           = $::nagios::client::service_contact_groups,
  $first_notification_delay = $::nagios::client::service_first_notification_delay,
  $max_check_attempts       = $::nagios::client::service_max_check_attempts,
  $notification_period      = $::nagios::client::service_notification_period,
  $notification_interval    = $::nagios::client::service_notification_interval,
  $notification_options     = $::nagios::client::service_notification_options,
  $notifications_enabled    = $::nagios::client::service_notifications_enabled,
  $use                      = $::nagios::client::service_use,
) inherits ::nagios::client {

  nagios::client::nrpe_plugin { 'check_ram':
    ensure => $ensure,
  }

  # Include defaults if no overrides in $args
  if $args !~ /-w/ { $arg_w = '-w 10% ' } else { $arg_w = '' }
  if $args !~ /-c/ { $arg_c = '-c 5% ' }  else { $arg_c = '' }
  $fullargs = strip("${arg_w}${arg_c}${args}")

  nagios::client::nrpe_file { 'check_ram':
    ensure => $ensure,
    args   => $fullargs,
  }

  nagios::service { "check_ram_${check_title}":
    ensure                   => $ensure,
    check_command            => 'check_nrpe_ram',
    service_description      => 'ram',
    servicegroups            => $servicegroups,
    check_period             => $check_period,
    contact_groups           => $contact_groups,
    first_notification_delay => $first_notification_delay,
    notification_period      => $notification_period,
    notification_interval    => $notification_interval,
    notification_options     => $notification_options,
    notifications_enabled    => $notifications_enabled,
    max_check_attempts       => $max_check_attempts,
    use                      => $use,
  }

}
