# configure ssh config

file_line {'no password':
  path=> '~/.ssh/config',
  line=>  'PasswordAuthentication no',
  match=> '^PasswordAuthentication'
  append_on_no_match=> 'true',
}

file_line {'identity file':
  path=> '~/.ssh/config',
  line=>  'IdentityFile ~/.ssh/holberton',
  match=> '^IdentityFile'
  append_on_no_match=> 'true',
}
