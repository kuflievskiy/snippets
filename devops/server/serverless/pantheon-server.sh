#### terminustoken
https://pantheon.io/docs/terminus/install/
https://pantheon.io/docs/terminus/commands/

curl -O https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar && php installer.phar install
terminus auth:login --machine-token=‹machine-token›


/home/dev/terminus/vendor/bin/terminus auth:login --machine-token=xxxxxx

/home/dev/terminus/vendor/bin/terminus auth:login --email=<EMAIL>
echo 'export PATH="/home/dev/terminus/vendor/bin:$PATH" >>~/.bash_profile


/usr/local/bin
ln -s source_file myfile

cd /usr/local/bin
ln -s /usr/local/terminus/vendor/bin/terminus terminus


terminus import:files DOMAIN.test files_backup_2018_11_23.tar.zip
terminus https:info DOMAIN.dev