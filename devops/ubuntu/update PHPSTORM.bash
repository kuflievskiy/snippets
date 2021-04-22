
##################################################################################################
# update PHPSTORM
##################################################################################################

# download an archive from https://www.jetbrains.com/phpstorm/download/#section=linux
# unpack it and cd to the bin folder, then execute ./phpstorm.sh


tar -xvf PhpStorm-2019.3.tar.gz
cd PhpStorm-193.5233.101
~/Downloads/PhpStorm-181.4668.78/bin
cd PhpStorm-193.5233.101/bin/

sudo rm -rf /etc/phpstorm/*
sudo cp ~/Downloads/PhpStorm-193.5233.101/* /etc/phpstorm -R

./phpstorm.sh

https://askubuntu.com/questions/800498/updating-php-storm-leads-to-a-icon
# unlock icon in launcher
# unpack the new version to whatever location you liked
# sh /bin/phpstorm.sh
# when asked if you want to use old setting and you so desire point phpstorm to the old .phpstorm directory
# go to Tools menu on PhpStorm and select Create Desktop Entry... from drop down
# when asked if you want to over write former desktop entry accept and your done.
# re-lock your icon again


~/.local/share/applications
/usr/share/applications/jetbrains-phpstorm.desktop

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/etc/phpstorm/bin/phpstorm.sh
Name=PhpStorm
Comment=PhpStorm
Icon=/etc/phpstorm/bin/phpstorm.png
