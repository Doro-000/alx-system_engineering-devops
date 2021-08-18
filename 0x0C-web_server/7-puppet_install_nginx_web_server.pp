# setup nginx

$redirect = "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n"
$file = '/etc/nginx/sites-available/default'

package {'nginx':
  ensure  => installed,
}

file {'/var/www/html/index.nginx-debian.html':
  content => 'Holberton School for the win!',
}

exec {'configure redirect':
  command => "sed -i '37i\ ${redirect}' ${file}",
  path    => '/usr/bin:/usr/sbin:/bin',
}

service {'nginx':
  ensure  => running,
}
