# manifest that kills a process named killmenow


exec {'pkill -f killmenow':
  cwd  => '/home',
  path => ['/usr/bin', '/usr/sbin'],
}
