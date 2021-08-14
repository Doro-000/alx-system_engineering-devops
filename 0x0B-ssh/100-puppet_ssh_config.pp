# configure ssh config

file {'create config':
  ensure  => 'present',
  path    => '~/.ssh/config',
  content => "PasswordAuthentication no\nIdentityFile ~/.ssh/holberton",
}
