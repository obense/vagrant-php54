# Default path
Exec 
{
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

exec 
{ 
    'apt-get update':
        command => '/usr/bin/apt-get update',
        require => Exec['add php54 apt-repo']
}

include bootstrap
include other
include apache
include php54 # steps for PHP 5.4 instead of 5.3 version
include php
include composer
include mysql
include phpmyadmin
include vim
