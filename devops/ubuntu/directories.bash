###
### Linux directories
###

# for current user only
~/.local/bin

# for all
/usr/local/bin

# scheduled crontabs
/var/spool/cron/crontabs

/var/run 
# The location of the pid file should be configurable. /var/run is standard for pid files,

/var/log
# The same as /var/log is standard for logs.


###
### Users and Permissions 
###

# Folder Permissions
                user group other
symbolyc mode   rwx  rwx   rwx
binary mode     111  101   101
numeric mode    7    5     5



/etc/passwd
/etc/group
/etc/shadow

umask 
umask 0002
# create folder 775
~/.profile
umask 0022

# global bash file
/etc/profile
/etc/profile.d/umask-setting-to-all.sh



sudo
/etc/sudoers


ls -la /etc/passwd | cut -d' ' -f3 | xargs

# dev server setup
664
add all users to the www-data group.
www-data:www-data

# /etc/apache2/envvars
export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data


# commands and utilites
passwd
sudo passwd <username>

sudo adduser <username>
sudo adduser <username> sudo
sudo deluser <username>

sudo -sHu <username> # change user
su <username> # change user, enter his passwrd

sudo chown <username>:<group> ./<file-folder-name>

chmod 755 ./<file-folder-name>
