```bash
find /var/www/vhosts/****sitename****/wp-content/plugins/ -type d -exec chmod 755 {} \;
find /var/www/vhosts/****sitename****/wp-content/plugins/ -type f -exec chmod 644 {} \;
find /var/www/vhosts/****sitename****/wp-content/plugins/ -type f -exec chown apache:apache {} \;
find /var/www/vhosts/****sitename****/wp-content/plugins/ -type d -exec chown apache:apache {} \;
```

```bash
stat -c "%a %n" *

# update chmod recursively
# chmod -R 777 uploads
```