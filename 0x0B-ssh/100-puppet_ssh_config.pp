# configure ssh config

exec {'edit ssh config file':
  command => "echo -e 'PasswordAuthentication no\n' >> ~/.ssh/config",
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
  cwd     => '/home',
  unless  => "grep 'PasswordAuthentication no' ~/.ssh/config",
}

exec {"echo -e 'IdentityFile ~/.ssh/holbeton\n' >> ~/.ssh/config":
  path   => ['/usr/bin', '/usr/sbin', '/bin'],
  cwd    => '/home',
  unless => "grep 'IdentityFile ~/.ssh/holberton' ~/.ssh/config",
}
