# bash wp-update.sh

# Prepare a backup of current files
tar -cvzf site_backup_`date '+%Y_%m_%d'`.tar.zip --exclude="wp-update.sh" $(pwd)'/.'

# download latest WordPress
wget wordpress.org/latest.tar.gz
wget https://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
echo 'Step 1. WordPress has been successfuly downloaded and unpacked!'

rm -rf wp-admin wp-includes license.txt readme.html wp-activate.php wp-blog-header.php wp-comments-post.php wp-config-sample.php wp-cron.php wp-links-opml.php wp-load.php wp-login.php wp-mail.php wp-pass.php wp-register.php wp-settings.php wp-signup.php wp-trackback.php xmlrpc.php
echo 'Step 2. Old files have been removed'

mv ./wordpress/wp-admin ./wp-admin
mv ./wordpress/wp-includes ./wp-includes
mv ./wordpress/license.txt ./license.txt
mv ./wordpress/readme.html ./readme.html
mv ./wordpress/wp-activate.php ./wp-activate.php
mv ./wordpress/wp-blog-header.php ./wp-blog-header.php
mv ./wordpress/wp-comments-post.php ./wp-comments-post.php
mv ./wordpress/wp-config-sample.php ./wp-config-sample.php
mv ./wordpress/wp-cron.php ./wp-cron.php
mv ./wordpress/wp-links-opml.php ./wp-links-opml.php
mv ./wordpress/wp-load.php ./wp-load.php
mv ./wordpress/wp-login.php ./wp-login.php
mv ./wordpress/wp-mail.php ./wp-mail.php
mv ./wordpress/wp-settings.php ./wp-settings.php
mv ./wordpress/wp-signup.php ./wp-signup.php
mv ./wordpress/wp-trackback.php ./wp-trackback.php
mv ./wordpress/xmlrpc.php ./xmlrpc.php
mv ./wordpress/index.php ./index.php
echo 'Step 3. New files has been added'

rm -rf wordpress
rm -f latest.tar.gz
echo 'Step 4. WordPress install archive has been removed!'
echo 'Update has been successfuly completed!'