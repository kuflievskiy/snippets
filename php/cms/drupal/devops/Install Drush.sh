
## Install Drush

cd /usr/local
sudo git clone https://github.com/drush-ops/drush
cd drush
sudo composer update
php drush --version
# Drush Commandline Tool 9.0-dev-g8c0f05a
sudo rm -f /usr/local/bin/drush
sudo ln -s /usr/local/drush/drush /usr/local/bin/drush
drush --version
