group { 'puppet': ensure => present }
Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
File { owner => 0, group => 0, mode => 0644 }

class {'apt':
  always_apt_update => true,
}

Class['::apt::update'] -> Package <|
    title != 'python-software-properties'
and title != 'software-properties-common'
|>

    apt::key { '4F4EA0AAE5267A6C': }

<<<<<<< HEAD
apt::ppa { 'ppa:ondrej/php5':
  require => Apt::Key['4F4EA0AAE5267A6C']
}

file { '/home/vagrant/.bash_aliases':
  ensure => 'present',
  source => 'puppet:///modules/puphpet/dot/.bash_aliases',
}
=======
apt::ppa { 'ppa:ondrej/php5-oldstable':
  require => Apt::Key['4F4EA0AAE5267A6C']
}

class { 'puphpet::dotfiles': }
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094

package { [
    'build-essential',
    'vim',
    'curl',
<<<<<<< HEAD
    'git-core',
    'git'
=======
    'git-core'
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094
  ]:
  ensure  => 'installed',
}

class { 'apache': }

apache::dotconf { 'custom':
  content => 'EnableSendfile Off',
}

apache::module { 'rewrite': }

<<<<<<< HEAD
apache::vhost { 'rfid-php-crud-laravel.dev':
  server_name   => 'rfid-php-crud-laravel.dev',
  serveraliases => [
    'www.rfid-php-crud-laravel.dev'
  ],
  docroot       => '/var/www/rfid-php-crud-laravel',
=======
apache::vhost { 'rfid-php-crud.dev':
  server_name   => 'rfid-php-crud.dev',
  serveraliases => [
    'www.rfid-php-crud.dev'
  ],
  docroot       => '/var/www/rfid-php-crud.dev/public',
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094
  port          => '80',
  env_variables => [
],
  priority      => '1',
}

class { 'php':
<<<<<<< HEAD
  service       => 'apache',
  module_prefix => '',
  require       => Package['apache'],
=======
  service             => 'apache',
  service_autorestart => false,
  module_prefix       => '',
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094
}

php::module { 'php5-mysql': }
php::module { 'php5-cli': }
php::module { 'php5-curl': }
php::module { 'php5-intl': }
php::module { 'php5-mcrypt': }
php::module { 'php5-sqlite': }

class { 'php::devel':
  require => Class['php'],
}

<<<<<<< HEAD
class { 'php::pear':
  require => Class['php'],
}




=======
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094

class { 'xdebug':
  service => 'apache',
}

class { 'composer':
  require => Package['php5', 'curl'],
}

puphpet::ini { 'xdebug':
  value   => [
    'xdebug.default_enable = 1',
    'xdebug.remote_autostart = 0',
    'xdebug.remote_connect_back = 1',
    'xdebug.remote_enable = 1',
    'xdebug.remote_handler = "dbgp"',
    'xdebug.remote_port = 9000'
  ],
  ini     => '/etc/php5/conf.d/zzz_xdebug.ini',
  notify  => Service['apache'],
  require => Class['php'],
}

puphpet::ini { 'php':
  value   => [
    'date.timezone = "America/Chicago"'
  ],
  ini     => '/etc/php5/conf.d/zzz_php.ini',
  notify  => Service['apache'],
  require => Class['php'],
}

puphpet::ini { 'custom':
  value   => [
    'display_errors = On',
    'error_reporting = -1'
  ],
  ini     => '/etc/php5/conf.d/zzz_custom.ini',
  notify  => Service['apache'],
  require => Class['php'],
}


class { 'mysql::server':
  config_hash   => { 'root_password' => 'vagrant' }
}


<<<<<<< HEAD
=======
class { 'phpmyadmin':
  require => [Class['mysql::server'], Class['mysql::config'], Class['php']],
}

apache::vhost { 'phpmyadmin':
  server_name => 'phpmyadmin',
  docroot     => '/usr/share/phpmyadmin',
  port        => 80,
  priority    => '10',
  require     => Class['phpmyadmin'],
}
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094

