#### How to create new DB user + DB and assign this user to DB

##### Login as an administrator 

```bash
sudo mysql -u root -p
```

##### Create DB, DB user and grant privileges to the DB table

```mysql
CREATE USER 'test'@'localhost' IDENTIFIED BY 'TEST123!password';
CREATE DATABASE test;
GRANT ALL PRIVILEGES ON  `test`.* TO  'test'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

##### Check

```bash
quit
mysql -u test -p
TEST123!password
```

```mysql
use test;
show tables;
```