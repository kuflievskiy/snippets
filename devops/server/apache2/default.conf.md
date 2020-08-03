
sudo vim /etc/apache2/sites-available/default.conf


<VirtualHost *.com:8080>
    <Directory "/home/dev/www/SITENAME_FOLDER">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    VirtualDocumentRoot /home/dev/www/SITENAME_FOLDER/
    VirtualScriptAlias  /home/dev/www/SITENAME_FOLDER/cgi-bin/
</VirtualHost>



sudo service apache2 restart
sudo service nginx restart