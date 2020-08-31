# Laradock
## Laradock is a full PHP development environment for Docker.
## https://laradock.io/getting-started/

```bash
# Init Laradock environment on nginx mysql
git submodule add https://github.com/Laradock/laradock.git
docker-compose up -d nginx mysql
docker-compose exec workspace bash
composer global require laravel/installer
laravel new blog

git init
git submodule add https://github.com/Laradock/laradock.git
docker-compose up -d apache2 mysql
docker-compose exec workspace bash
composer global require laravel/installer
laravel new blog
```

#### laradock/apache2/sites/default.apache.conf

```bash
<VirtualHost *:80>
  ServerName localhost
  DocumentRoot /var/www/public
  Options Indexes FollowSymLinks

  <Directory "/var/www/public">
    AllowOverride All
    <IfVersion < 2.4>
      Allow from all
    </IfVersion>
    <IfVersion >= 2.4>
      Require all granted
    </IfVersion>
  </Directory>

</VirtualHost>
```