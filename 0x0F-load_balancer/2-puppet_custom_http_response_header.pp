# creates a custom HTTP header response

package {'nginx':
  ensure  => installed,
}

file {'/var/www/html/index.nginx-debian.html':
  content => 'Holberton School for the win!',
}

file_line {'configure redirection':
  path => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line => "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n",
  line => '\n\tadd_header X-Served-By $hostname;\n',
}

service {'nginx':
  ensure  => running,
}
