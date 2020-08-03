```bash
sudo chown -R www-data:www-data /home/dev/www/laravel

dev@kuf  ~/www/laravel  sudo find /home/dev/www/laravel -type f -exec chmod 644 {} \;
dev@kuf  ~/www/laravel  sudo find /home/dev/www/laravel -type d -exec chmod 755 {} \;
sudo usermod -a -G www-data dev

```