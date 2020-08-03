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
##################################################################################################
# DRUPAL
##################################################################################################


drush user-create adminuser --mail="xxx@gmail.com" --password="123"; drush user-add-role "administrator" adminuser

{{ dump(_context|keys) }}
печатает переменные в шаблоне


## D8 deploy scenario "without changes in the database"

## Dump production database
drush sql-dump --gzip > ./tmp/db_dump_before_update.sql.
drush sset system.maintenance_mode 1
git pull origin master
composer install
drush updb
drush cr
# Enable module "API v2"
drush en api_v2
drush sset system.maintenance_mode 0

## D8 deploy scenario "import the configuration on a different site"
# get UUID on the source site
drush config-get "system.site" uuid
drush config-export --destination config-export

# set UUID on the destination site
drush config-set "system.site" uuid "fjfj34-e3bb-2ab8-4d21-9100-b5etgetgd99d5"
drush config-import --source config-export


##################################################################################################
# WordPress Security
##################################################################################################

zgrep 'xx.xx.xx.194' *.gz | awk '{print $7;}' | grep '.php'

ps -ef | grep myProcessName | grep -v grep | awk '{print $2}' | xargs kill -9

ps -A


ps -ef | grep php-xdebug | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep /home/dev/www/.../S3_upload.php | grep -v grep | awk '{print $2}' | xargs kill -9