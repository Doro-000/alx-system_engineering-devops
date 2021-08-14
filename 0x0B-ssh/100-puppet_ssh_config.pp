# configure ssh config

file {'/root/.ssh/config':
  ensure  => 'present',
  content => "PasswordAuthentication no\nIdentityFile ~/.ssh/holberton",
}
