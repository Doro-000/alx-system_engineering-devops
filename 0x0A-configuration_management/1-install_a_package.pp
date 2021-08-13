# Install package

class puppet_install {
	package {"puppet-lint":
		version=> "2.1.1",
		ensure=> "present",
	}
}

include puppet_install
