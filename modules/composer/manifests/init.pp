# Class: composer
#
# Installs Composer
class composer (
<<<<<<< HEAD
    $install_location = '/usr/bin',
    $filename         = 'composer'
) {
  $composer_location = $install_location
  $composer_filename = $filename

  exec { "composer-${install_location}":
    command => "curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/vagrant && mv /home/vagrant/composer.phar ${install_location}/${filename}",
    path    => ['/usr/bin' , '/bin'],
=======
    $install_location = params_lookup( 'install_location' ),
    $filename         = params_lookup( 'filename' )
) inherits composer::params {

  exec { "curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/vagrant && mv /home/vagrant/composer.phar ${install_location}/${filename}":
    path    => ['/usr/bin', '/bin'],
    creates => "${install_location}/${filename}",
    require => Package['php'],
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094
  }
}
