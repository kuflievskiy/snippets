tail -n 35500 ./log/system.log | \
grep -e 'report.ERROR:' -e '\[2022' | \
awk -F 'report.ERROR: ' '{print $2}' | \
sort | uniq -c | sort -rn | \
sed '/^$/d' > system-summary.log



sudo grep -rnw 'Fatal' /var/log | \
awk -F 'Fatal error: ' '{print $2}' |  \
sort | uniq -c | sort -rn | \
tail -n 10
