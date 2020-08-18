class apache($apachename = $::apache::params::apachename,) inherits ::apache::params{
    package { 'apache':
        name    => $apachename,
        ensure  => present,
    }

# When the configuration file changes, Apache needs to restart. 
# To automate this, we can use the service resource in combination with
# the notify attribute, which will call the resource to run whenever 
# the configuration file is changed.

    file { 'configuration-file':
        path    =>  $conffile,
        ensure  =>  file,
        source  =>  $confsource,
        notify  =>  Service['apache-service'],
    }
 
# hasrestart attribute is used to trigger a restart of the defined service.
    service { 'apache-service':
        name        =>  $apachename,
        hasrestart  =>  true,
    }

}
