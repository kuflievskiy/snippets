#### Install WP CLI

```bash
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
```

#### 

```bash
wp search-replace 'test1.com' 'test2.com' --all-tables --dry-run
php wp-cli.phar search-replace 'test1.com' 'test2.com' --all-tables --dry-run
```