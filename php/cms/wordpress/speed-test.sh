#!/usr/bin/env bash

# Quick and dirty script to test wp speed
for p in $(wp plugin list --fields=name --status=active)
do
	echo $p
	wp plugin deactivate $p
	for i in {1..5}
	do
		curl -so /dev/null -w "%{time_total}\n" \
		-H "Pragma: no-cache" http://localhost/
	done
	wp-plugin active $p
done


curl -s -o /dev/null \
	-w "%{time_total}\n" \
	-H "Pragma: no-cache" http://localhost/


# -s --silent
# Silent or quiet mode. Don't show progress meter or error messages. Makes Curl mute. It will still output the data you ask for, potentially even to the terminal/stdout unless you redirect it.

# -o, --output <file>
# Write output to <file> instead of stdout. ...

curl -s -o /dev/null \
--verbose \
-w "TIME_PRE_TRANSFER: %{time_pretransfer} TIME_TOTAL: %{time_total} HTTP_CODE %{http_code}\n" \
-H "Pragma: no-cache" http://localhost/