```
mysql --verbose -u cms -p'DB_PASSWORD' -e "DROP DATABASE DB_NAME;"
mysql --verbose -u cms -p'DB_PASSWORD' -e "CREATE DATABASE DB_NAME;"
mysql --verbose -u cms -p'DB_PASSWORD' DB_NAME < db_dump_DB_NAME.sql

# DB export
mysql -u USERNAME -pPASSWD DBNAME
mysqldump --verbose -u USERNAME -pPASSWD DBNAME --default-character-set=utf8 > DBNAME.sql
mysqldump --verbose -u USERNAME -pPASSWD DBNAME --default-character-set=utf8 > db_dump_`date '+%Y_%m_%d'`.sql

# DB import
mysql --verbose -u USERNAME -p database_name < db_dump.sql

nano db_dump.sql // Add "use DB_NAME;"
mysql -u USERNAME -p < db_dump.sql


# execute MySql command from the console
mysql -u USERNAME -pPASSWD -e "USE db_wordpress; UPDATE wp_options SET option_value='http://xxx.compute-1.amazonaws.com' WHERE option_name='siteurl' OR option_name='home';"


# GRANT ALL PRIVILEGES ON  `db\_name` . * TO  'username'@'localhost' WITH GRANT OPTION ;

#update mysql user password
use mysql;
update user set password=PASSWORD('Pass1!#super_password') where User='devmysqluser';
flush privileges;
quit

# Insert user into the WordPress site
INSERT INTO `wp_users` (`user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES ('cmsdev', MD5('123'), 'cmsdev', 'xxxxxx@gmail.com', '', '2013-12-18 12:00:00', '', '0', 'cmsdev');
SET @lid = LAST_INSERT_ID();
INSERT INTO `wp_usermeta` (`user_id`, `meta_key`, `meta_value`) VALUES (@lid, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
INSERT INTO `wp_usermeta` (`user_id`, `meta_key`, `meta_value`) VALUES (@lid, 'wp_user_level', 10);

# update user password
UPDATE `wp_users` SET `user_pass`=MD5('changemesoon') WHERE ID = 123;
UPDATE `wp_users` SET `user_pass`=MD5('changemesoon') WHERE user_email = 'some@email.com';



CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON . TO 'username'@'localhost' WITH GRANT OPTION;
CREATE USER 'username'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON . TO 'username'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;



sudo mysql -u root -p
%TYPE_ROOT_PASSWORD_HERE%
CREATE USER 'test'@'localhost' IDENTIFIED BY 'TEST123!password';
CREATE DATABASE test;
GRANT ALL PRIVILEGES ON  `test`.* TO  'test'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
quit

mysql -u test -p
TEST123!password
use test;
show tables;

#### Change database and table charset encoding
ALTER DATABASE ***DATABASE_NAME*** CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE ***DATABASE_TABLE_NAME*** CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;

# How to fetch duplicated rows by several columns ( MySQL Request )
# fetch duplicated rows by several columns ( example : street_address, city, zip )
SELECT u.id, u.email, u.first_name, u.last_name, u.street_address, u.city, u.zip
FROM wp_dbe_offer_requests u
INNER JOIN (
    SELECT street_address, city, zip, COUNT( * ) 
    FROM wp_dbe_offer_requests
    GROUP BY street_address, city, zip
    HAVING COUNT( * ) >1
)temp ON temp.street_address = u.street_address
AND temp.city = u.city
AND temp.zip = u.zip
ORDER BY street_address, city, zip, id DESC


```
