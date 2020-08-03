```bash
# check a folders size on ubuntu
du --max-depth=1 | sort -n | awk 'BEGIN {OFMT = "%.0f"} {print $1/1024,"MB", $2}'
du --si --max-depth=1
sudo du -h /var/lib/mysql
sudo du --si --max-depth=0 /var/lib/mysql

# Common disk usage informations
df -h

# disk usage in the current dir
du -sh
# disk usage in the all dir's
du -sh /*

# disk usage by folders in the currnt dir
du -h --max-depth=1
```