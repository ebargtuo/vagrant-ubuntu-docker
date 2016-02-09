class docker {
    exec {['key']:
        command => '/usr/bin/apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D',
    }
    ->
    exec {['docker-sources']:
        command => '/bin/echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list',
    }
    ->
    package {['lxc-docker']:
        ensure => purged,
    }
    ->
    package {['docker-engine']:
        ensure => present,
        require => Exec['apt-get update'],
    }
    group {'docker':
        ensure => present,
    }
    ->
    exec {['gpasswd -a vagrant docker']:
        command => '/usr/bin/gpasswd -a vagrant docker',
    }
    ->
    service {['docker']:
        ensure => running,
    }
}
