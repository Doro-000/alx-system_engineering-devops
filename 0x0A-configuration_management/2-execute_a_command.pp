# manifest that kills a process named killmenow

class kill_killmenow {
	exec {"pkill -f killmenow":
		cwd=> "/home",
	}
}

include kill_killmenow
