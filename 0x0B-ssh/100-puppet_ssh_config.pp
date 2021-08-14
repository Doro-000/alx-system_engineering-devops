# configure ssh config

exec {'Turn off passwd auth':
  command => "echo -e 'PasswordAuthentication no\n' >> /etc/ssh/ssh_config",
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
  cwd     => '/home',
}

exec {'Declare identity file':
  command=> "echo -e 'IdentityFile ~/.ssh/holbeton\n' >> /etc/ssh/ssh_config",
  path   => ['/usr/bin', '/usr/sbin', '/bin'],
  cwd    => '/home',
}
