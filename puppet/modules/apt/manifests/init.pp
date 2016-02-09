class apt {
    exec {'apt-get update':
        command => '/usr/bin/apt-get update',
    }
    package {['apt-transport-https', 'ca-certificates']:
        ensure => present,
        require => Exec['apt-get update'],
    }
}
