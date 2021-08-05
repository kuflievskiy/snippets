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
sudo
/etc/sudoers


ls -la /etc/passwd | cut -d' ' -f3 | xargs
