#!/usr/bin/awk -f

BEGIN {
	FS = "[ \t]"

	# Store the should state read from stdin in should array
	while ((getline should_line < "/dev/stdin")) {
		k = substr(should_line, 1, index(should_line, " ") - 1)
		v = substr(should_line, length(k) + 2)
		should[k] = v
	}
}

/^# DO YOUR EDITS BELOW THIS POINT/ { edits_allowed = 1 }

edits_allowed {
	line = $0
	sub(/^#*[ \t]*/, "", line)
	split(line, toks)
	# toks[i] = { "set_var", key, ... }
	
	if (toks[1] == "set_var") {
		varname = toks[2]
		if (/^#/) {
			# keep comments
			print
		}
		if ((varname in should)) {
			# replace line with value from should
			printf "set_var %s %s\n", varname, should[varname]
			delete should[varname]
		} else {
			# drop it
		}

		next  # do not print line below
	}
}

{ print }

END {
	for (k in should) {
		printf "set_var %s %s\n", k, should[k]
	}
}
