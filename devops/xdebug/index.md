#### <a href="/snippets/devops/xdebug/#php-xdebug-console-confgiguration">php-xdebug console debugging</a>
````bash
sudo touch php-xdebug
sudo vim php-xdebug
sudo chown dev:dev php-xdebug
sudo chmod +x php-xdebug
sudo mv php-xdebug /usr/bin/php-xdebug
````
 
````bash
#!/bin/bash
#
#  # lines below should decrease the useless xdebug temp data in the /tmp folder
#  xdebug.profiler_enable=0
#  xdebug.profiler_enable_trigger=1
#  #xdebug.profiler_output_dir=/tmp/cachegrind
#  xdebug.profiler_output_dir=./xdebug-profiler
#  xdebug.profiler_output_name=trace.%s____%R
#
export XDEBUG_CONFIG="idekey=PHPSTORM"
export XDEBUG_CONFIG="remote_port=9000"
export XDEBUG_CONFIG="remote_host=localhost"
export XDEBUG_CONFIG="remote_autostart=0"
export XDEBUG_CONFIG="remote_connect_back=0"
export XDEBUG_CONFIG="remote_enable=1"
php $1
````

````bash
EXAMPLE : 
php-xdebug /home/dev/www/snippets/index.php
````

````bash
*/1 * * * * /usr/bin/php /home/dev/www/{sitename}/{path_to_file}.php > /dev/null 2>&1 &
*/1 * * * * /usr/bin/php-xdebug kufHulkServer /home/dev/www/{sitename}/{path_to_file}.php > /dev/null 2>&1 &
````

# https://www.jetbrains.com/help/phpstorm/zero-configuration-debugging-cli.html
php -dzend_extension=xdebug.so -dxdebug.remote_enable=1 -dxdebug.remote_mode=req -dxdebug.remote_port=9000 -dxdebug.remote_host=localhost -dxdebug.remote_autostart=1 <path>

phpunit-debug

````bash
cd /usr/bin
sudo touch phpunit-debug
sudo vim phpunit-debug
````

````
#!/bin/bash
export PHP_IDE_CONFIG="serverName=$1"
export XDEBUG_CONFIG="idekey=PHPSTORM"
phpunit $2 $3 $4 $5
````

EXAMPLE : 
````
bash /usr/bin/phpunit-debug pmtServer -c phpunit.xml ./build/tests/pmtsystem/wordpress-plugins-test.php
````

````bash
sudo vim /etc/php5/apache2/php.ini
zend_extension="/usr/lib/php5/20121212/xdebug.so"
xdebug.remote_connect_back=off
xdebug.remote_enable=on
xdebug.remote_autostart=off
# lines below should decrease the useless xdebug temp data in the /tmp folder
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
````

````
sudo vim /etc/php5/cli/php.ini
/etc/php5/cli/php.ini
zend_extension="/usr/lib/php5/20121212/xdebug.so"
xdebug.remote_enable = 1
xdebug.idekey=PHPSTORM
xdebug.remote_autostart = 1
xdebug.remote_connect_back = 1
xdebug.remote_port = 9000
xdebug.remote_handler=dbgp
xdebug.remote_host=localhost
````

### run-xdebug-with-curl
```bash
curl -X POST -d '{"some":"data"}' http://your-local-domain -b XDEBUG_SESSION=PHPSTORM
```

https://confluence.jetbrains.com/display/PhpStorm/Debugging+PHP+CLI+scripts+with+PhpStorm#DebuggingPHPCLIscriptswithPhpStorm-2.StarttheScriptwithDebuggerOptions
https://confluence.jetbrains.com/display/PhpStorm/Troubleshooting+PhpStorm+debugging

xampp php.ini

```bash
;E:\xampp\php\php.ini
zend_extension="E:\xampp\php\ext\php_xdebug.dll"
;xdebug.remote_connect_back=off
xdebug.remote_enable=on
xdebug.remote_host="127.0.0.1"
xdebug.remote_handler="dbgp"
xdebug.remote_port=9000
```

#### <a href="/snippets/devops/xdebug/#xdebug-default-confgiguration">xdebug php.ini</a>

```bash
xdebug.remote_autostart=off
xdebug.remote_connect_back=off
xdebug.remote_enable=on
# lines below should decrease the useless xdebug temp data in the /tmp folder
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
#xdebug.profiler_output_dir=/tmp/cachegrind
xdebug.profiler_output_dir=./xdebug-profiler
xdebug.profiler_output_name=trace.%s____%R
```