class apt {
    exec {['sources']:
        command => '/bin/echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list',
    }
    ->
    exec {'apt-get update':
        command => '/usr/bin/apt-get update',
    }
}
