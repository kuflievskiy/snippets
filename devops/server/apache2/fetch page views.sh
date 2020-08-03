
# grep -v 'bot.*Bot'
# is used in order to exclude BOTS from the statistic

# fetch page views for the site main page
cat /var/log/apache2/access.log | grep '"GET / HTTP/1.1" 200.*"-"' | grep -v 'bot.*Bot' | awk '{print ";" $1 ";" $0 }' | sort -n | uniq -c | sort -rn > statistics_log_start_page.csv

# fetch page views for the site `/thanks/` page
cat /var/log/apache2/access.log | grep '"GET /thanks/ HTTP/1.1".*"-"' | grep -v 'bot.*Bot' | awk '{print ";" $1 ";" $0 }' | sort -n | uniq -c | sort -rn > statistics_log_thanks_page.csv
