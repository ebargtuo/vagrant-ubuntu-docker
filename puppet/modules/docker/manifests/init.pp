class docker {
    exec {['key']:
        command => '/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9',
    }
    ->
    exec {['docker-sources']:
        command => '/bin/echo "deb https://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list',
    }
    ->
    package {['lxc-docker']:
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
