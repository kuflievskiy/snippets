#!/usr/bin/env bash

https://drushcommands.com/drush-8x/sql/sql-dump/
drush sql-dump --result-file=db_dump.sql
drush sql-create --db-su=DB_USER --db-su-pw=DB_PASSWORD --db-url="mysql://DB_USER:DB_PASSWORD@127.0.0.1/DBNAME"
