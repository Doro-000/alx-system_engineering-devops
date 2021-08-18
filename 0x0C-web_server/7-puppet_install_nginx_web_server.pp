# setup nginx

package {'nginx':
  ensure  => installed,
}

file {'/var/www/html/index.nginx-debian.html':
  content => 'Holberton School for the win!',
}

exec {'configure redirect':
  command => 'sed -i "37i\\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n\" /etc/nginx/sites-available/default',
  path    => '/usr/bin:/usr/sbin:/bin',
  user    => 'root',
}

service {'nginx':
  ensure  => running,
}
