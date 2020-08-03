# HowTo Copy a Folder
# -a : Preserve the specified attributes such as directory an file mode, ownership, timestamps, if possible additional attributes: context, links, xattr, all.
# -v : Explain what is being done.
# -r : Copy directories recursively.

```bash
cp -avr dirname1 dirname2
```

## include hidden files
```bash
cp -aR folder1/. folder2/
```

## kill apache2 process

```bash
kill -9 $(ps -e | grep apache2 | awk '{print $1}')
```

```bash
ps -A|grep mysql
sudo pkill mysql
ps -A|grep mysqld
sudo pkill mysqld
service mysql restart
```

## APACHE Commands

```bash
sudo apachectl -k restart
sudo /etc/init.d/apache2 restart
```

## Restart MySQL

```bash
sudo /etc/init.d/mysql restart
# restart `mariadb`
service mariadb restart
```

## view info about `qmail` process

```bash
ps uax | grep qmail
```

## enable admin mode

```bash
sudo -s
```

## rename file
```bash
mv file_name_previous.sql file_name_new.sql
```

## search by file name

```bash
find -name "filename"
find / -name filename.php
# search for the files which have .php.bak name endings
find . -type f -name "*.php.bak"
```

## search for `eval` string in the al files

```bash
grep -rnw eval --exclude-dir=.git ./
```

## export the last 3000 rows from the log file

```bash
tail -n 3000 error_log > /home/.............../error_log
```


