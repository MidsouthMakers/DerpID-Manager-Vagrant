define composer::run (
  $path,
  $command = 'install'
) {

  include composer

<<<<<<< HEAD
  exec { "composer-${path}-${command}-${composer::composer_location}":
    command => "${composer::composer_filename} ${command} --working-dir ${path}",
    path    => "/usr/bin:/usr/sbin:/bin:/sbin:${composer::composer_location}",
=======
  exec { "${composer::filename} ${command} --working-dir ${path}":
    environment => "COMPOSER_HOME=${composer::install_location}",
    path        => ['/usr/bin', '/bin', $composer::install_location],
    require     => Package['php'],
>>>>>>> f96fe9d44d7b80899fb28b9102c5a87ccc8e4094
  }
}
