BEGIN {
	skip_level = 2
	FS = "(│   )|(├── )|(└── )|(    )"
}

NF > skip_level {
	next
}

{
    opened_dirs["./bundle"] = ""
    opened_dirs["./bundle/one.kak"] = ""
    opened_dirs["./colors"] = ""

    if ($NF in opened_dirs) {
    	skip_level = NF + 1
	}else if (NF > 1)
		skip_level = NF

    print
}
