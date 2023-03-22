#!/usr/bin/awk -f

BEGIN {
	FS = "[ \t]"

	# Store the should state read from stdin in should array
	while (("cat" | getline should_line)) {
		k = substr(should_line, 1, index(should_line, " ") - 1)
		v = substr(should_line, length(k) + 2)
		should[k] = v
	}
	close("cat")
}

/^# DO YOUR EDITS BELOW THIS POINT/ { edits_allowed = 1 }

edits_allowed {
	line = $0
	sub(/^[ \t]*#*[ \t]*/, "", line)
	split(line, toks)
	# toks[i] = { "set_var", key, ... }

	if (toks[1] == "set_var") {
		varname = toks[2]
		if ($1 ~ /^#/) {
			# keep comments
			print
		}
		if ((varname in should)) {
			# replace line with value from should
			printf "set_var %s\t%s\n", varname, should[varname]
			delete should[varname]
		} else {
			# drop it
		}

		next  # do not print set_var line below
	}
}

{ print }

END {
	for (varname in should) {
		printf "set_var %s\t%s\n", varname, should[varname]
	}
}
