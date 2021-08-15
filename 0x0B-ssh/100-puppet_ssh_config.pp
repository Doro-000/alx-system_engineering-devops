# configure ssh config

file_line {'Turn off passwd auth':
  path=> '/home/.ssh/config',
  line=> 'PasswordAuthentication no',
}

file_line {'Declare identity file':
  path=> '/home/.ssh/config',
  line=> 'IdentityFile ~/.ssh/holberton',
}
