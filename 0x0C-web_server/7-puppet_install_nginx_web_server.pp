# setup nginx

package {'nginx':
  ensure  => installed,
}

service {'nginx':
  ensure  => running,
}
