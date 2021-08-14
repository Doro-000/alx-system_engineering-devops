# configure ssh config

file {'create config':
  path=> '~/.ssh/config',
  ensure => 'present',
  content=> "PasswordAuthentication no\nIdentityFile ~/.ssh/holberton",
}
