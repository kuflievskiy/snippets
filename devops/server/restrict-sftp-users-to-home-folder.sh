##################################################################################################
# restrict-sftp-users-to-home-folder
##################################################################################################

https://bensmann.no/restrict-sftp-users-to-home-folder

sudo adduser someusername
sudo passwd someusername someusernamePASS

sudo vim /etc/ssh/sshd_config


sudo usermod someusername -g sftponly

sudo usermod someusername -s /bin/false

sudo usermod -d /home/dev/www/project-name someusername

sudo service ssh restart

pwd
sudo usermod -d /home/dev/www/project-name
sudo usermod -d /home/dev/www/project-name someusername
sudo vim /etc/ssh/sshd_config
sudo service ssh restart
ls -la
sudo vim /etc/ssh/sshd_config
sudo service ssh restart
sudo vim /etc/ssh/sshd_config
sudo groupadd sftponly
usermod someusername -g sftponly
sudo usermod someusername -g sftponly
sudo usermod someusername -s /bin/false
service ssh restart
sudo passwd someusernamePASS
sudo passwd someusername

mkdir /home/someusername/project-name
sudo mkdir /home/someusername/project-name
sudo chmod someusername:someusername /home/someusername/project-name
sudo chown someusername:someusername /home/someusername/project-name
sudo mount --bind /home/dev/www/project-name /home/someusername/project-name



# add MAIN group 'dev'
# add not-Main goup `sftponly`
sudo adduser someusername sftponly
sudo usermod someusername -g dev


## Files in the project should be:
sudo find . -type f -exec chmod 0664 {} ';'
sudo find . -type d -exec chmod 0775 {} ';'


sudo vim /home/someusername/.profile
umask 002


sudo vim /home/dev/.profile
umask 002


sudo vim /etc/apache2/envvars
export APACHE_RUN_GROUP=dev
umask 0002



sudo chmod 755 /home/someusername

sudo service apache2 restart

sudo cat /etc/group | grep 'sftponly'
sudo tail -f /var/log/auth.log