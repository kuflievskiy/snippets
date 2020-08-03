http://thunder.org/
http://www.thunder.org/slack
http://thunder.org/job-offer


https://www.drupal.org/project/thunder

https://github.com/BurdaMagazinOrg/thunder-project

composer create-project burdamagazinorg/thunder-project thunder-project --stability dev --no-interaction
	
https://github.com/BurdaMagazinOrg/thunder-project

composer create-project burdamagazinorg/thunder-project MYPROJECT --stability dev --no-interaction
cd MYPROJECT
composer require drupal/devel:1.*
composer update

sudo vim /etc/apache2/sites-enabled/default.conf
------------------------------------------------------------------
Alias /robots.txt /home/dev/www/robots.txt
LogFormat "%V %h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" vhosts
CustomLog /var/log/apache2/access.log vhosts
ErrorLog /var/log/apache2/error_log

<VirtualHost *:8080>
	<Directory "/home">
		Options Indexes FollowSymLinks
		AllowOverride All
		Require all granted
	</Directory>
	VirtualDocumentRoot /home/dev/www/%-5/
	VirtualScriptAlias  /home/dev/www/%-5/cgi-bin/
</VirtualHost>



	
cd /etc/apache2/sites-enabled/
sudo touch thunder-project.conf
sudo vim /etc/apache2/sites-enabled/thunder-project.conf
------------------------------------------------------------------



LogFormat "%V %h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" vhosts
CustomLog /var/log/apache2/access.log vhosts
ErrorLog /var/log/apache2/error_log

<VirtualHost *:8080>
servername test-domain.com
    <Directory "/home/dev/www/thunder-project/docroot">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    VirtualDocumentRoot /home/dev/www/thunder-project/docroot
    VirtualScriptAlias  /home/dev/www/thunder-project/docroot/cgi-bin/
</VirtualHost>
