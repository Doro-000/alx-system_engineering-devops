# configure ssh config

file {'/home/.ssh/config':
  ensure => 'file',
}

file_line {'Turn off passwd auth':
  path => '/home/.ssh/config',
  line => 'PasswordAuthentication no',
  require => File['/home/.ssh/config'],
}

file_line {'Declare identity file':
  path => '/home/.ssh/config',
  line => 'IdentityFile ~/.ssh/holberton',
  require => File['/home/.ssh/config'],
}
