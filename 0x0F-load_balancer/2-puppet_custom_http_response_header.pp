# creates a custom HTTP header response

package {'nginx':
  ensure  => installed,
}

file_line {'configure custom header':
  path => '/etc/nginx/sites-available/default',
  before => 'server_name _;',
  line => "\nCUSTOMHEADER=\n\tadd_header X-Served-By $hostname;\n",
}

service {'nginx':
  ensure  => running,
}
