class composer(
    $target_dir      = '/usr/local/bin',
    $composer_file   = 'composer',
    $download_method = 'curl',
    $logoutput       = false) {

    include augeas

    $php_package     = 'php5-cli'
    $tmp_path        = '/home/vagrant'

    exec { 'download_composer':
        command     => 'curl -s http://getcomposer.org/installer | php',
        cwd         => $tmp_path,
        require     => [
            Package['curl', $php_package],
            Augeas['whitelist_phar', 'allow_url_fopen'], ],
        creates     => "$tmp_path/composer.phar",
        logoutput   => $logoutput,
    }

    file { $target_dir:
        ensure      => directory,
    }

    file { "$target_dir/$composer_file":
        ensure      => present,
        source      => "$tmp_path/composer.phar",
        require     => [
            Exec['download_composer'],
            File[$target_dir],
        ],
        group       => 'staff',
        mode        => '0755',
    }

    exec { 'update_composer':
        command     => "$target_dir/$composer_file self-update",
        require     => File["$target_dir/$composer_file"],
    }

    augeas { 'whitelist_phar':
        context     => '/files/etc/php5/conf.d/suhosin.ini/suhosin',
        changes     => 'set suhosin.executor.include.whitelist phar',
        require     => Package[$php_package],
    }

    augeas { 'allow_url_fopen':
        context     => '/files/etc/php5/cli/php.ini/PHP',
        changes     => 'set allow_url_fopen On',
        require     => Package[$php_package],
    }
}
