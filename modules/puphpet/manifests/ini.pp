# defined type puphpet::ini
#
# Writes custom ini files. This generation
# is independent from any other resource, so you have to
# notify the needed resources on your own.
#
# Example:
# puphpet::ini { 'custom_php':
#  value   => ['date.timezone = "America/Chicago"'],
#  ini     => '/etc/php5/cgi/conf.d/custom_php.ini',
#  notify  => Service['apache'],
# }
#
define puphpet::ini (
    $value    = '',
    $ini      = undef,
<<<<<<< HEAD
    $template = 'extra-ini.erb',
=======
    $template = 'extra-ini.erb'
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094
) {

  if $ini {
      file { $ini:
        ensure  => present,
        content => template("puphpet/${template}"),
      }
  }

}
