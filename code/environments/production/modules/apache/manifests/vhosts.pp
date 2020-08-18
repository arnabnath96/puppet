class apache::vhosts {
    if $::osfamily == 'RedHat' {
        file { '/etc/httpd/conf.d/vhost.conf':
            ensure    => file,
            content   => template('apache/vhosts-rh.conf.erb'),
        }

        file { [ '/var/www/$servername', '/var/www/$servername/public_html', '/var/www/$servername/log',]:
            ensure    => directory,
        }
    }
    elsif $::osfamily == 'Debian' {
        file { "/etc/apache2/sites-available/$servername.conf":
            ensure  => file,
            content  => template('apache/vhosts-deb.conf.erb'),
        }

        file { [ '/var/www/$servername', '/var/www/$servername/public_html', '/var/www/$servername/logs', ]:
            ensure    => directory,
        }
    }
    else {
        fail('distro not supported')
    }
 
}
