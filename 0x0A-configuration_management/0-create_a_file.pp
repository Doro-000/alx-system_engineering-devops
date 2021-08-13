# Create a file

class create_file {
	file {"/tmp/holberton":
		ensure=> "present",
		mode=> "0744",
		owner=> "www-data",
		group=> "www-data",
		content=> "I love Puppet",
	}
}

include create_file
