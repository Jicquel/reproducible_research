#!/bin/bash

for file in data/*.log;do
	file_no_ext=data/$(basename "$file" ".log")

	#writing CSV headers
	echo "date size time" > "$file_no_ext"".csv"

	#Formatting data and removing incoherent data
	sed -e 's/\ bytes.*time=\(.*\) ms/ \1/g' -e 's/\[\(.*\)]/\1/g' "$file_no_ext"".log" | grep "^[0-9]*.[0-9]* [0-9]* [0-9]*.[0-9]*$" >> "$file_no_ext"".csv"
done;


