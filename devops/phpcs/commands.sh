
##################################################################################################
# PhpCS
##################################################################################################

### <a href="https://github.com/squizlabs/PHP_CodeSniffer">PHP CodeSniffer</a>

#### PHPCS Install or Update

```
## Remove previous version if required
sudo apt-get remove --auto-remove php-codesniffer
sudo apt-get update
sudo apt-get install php-codesniffer

# some certain phpcs version
sudo pear install PHP_CodeSniffer-2.8.1
phpcs --version
```
### How to install <a href="https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git">WordPress Coding Standards</a>

```bash
git clone https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git
sudo rm -rf /usr/share/php/PHP/CodeSniffer/Standards/WordPress/
cd /usr/share/php/PHP/CodeSniffer/Standards
sudo git clone https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git WordPress
sudo phpcs --config-set installed_paths /usr/share/php/PHP/CodeSniffer/Standards/WordPress
sudo vim /usr/share/php/data/PHP_CodeSniffer/CodeSniffer.conf
```

```php
/usr/share/php/data/PHP_CodeSniffer/CodeSniffer.conf                                                                                                                                                                                             121/121               100%
<?php $phpCodeSnifferConfig = [ 'installed_paths' => '/usr/share/php/PHP/CodeSniffer/Standards/WordPress/' ];
```

```bash
phpcs -i
The installed coding standards are Zend, PEAR, Squiz, PSR2, MySource, PHPCS, PSR1, WordPress-Core, WordPress-Extra, WordPress-Docs, WordPress and WordPress-VIP
phpcs --config-set default_standard WordPress
```

##### Usage example :

```bash
phpcs -v --standard=phpcs.ruleset.xml --extensions=php --report=source --error-severity=1 --warning-severity=8 ./wp-content/themes/pmtsystem/

# https://github.com/squizlabs/PHP_CodeSniffer/wiki/Fixing-Errors-Automatically
phpcs -v --standard=phpcs.ruleset.xml --report-diff=diff.diff ./wp-content/themes/pmtsystem/
phpcs -v --standard=phpcs.ruleset.xml --report-diff=changes.diff ./wp-content/themes/some-file-path/file.php
patch -p0 -ui changes.diff

```


#### phpcbf

vendor/bin/phpcbf \
        --extensions=php \
         --standard=phpcs.ruleset.xml \
         --warning-severity=8 \
         --error-severity=1 \
         ./wp-content/themes/some-file-path/file.php


# https://github.com/squizlabs/PHP_CodeSniffer
composer global require "squizlabs/php_codesniffer=*"

# https://github.com/PHPCompatibility/PHPCompatibility
# TBD https://github.com/PHPCompatibility/PHPCompatibilityAll

composer require "squizlabs/php_codesniffer=*" --dev
composer require "phpcompatibility/php-compatibility" --dev
./vendor/bin/phpcs --config-set installed_paths vendor/phpcompatibility/php-compatibility
./vendor/bin/phpcs -i

# PHPCompatibility
# @link https://github.com/PHPCompatibility/PHPCompatibility
./vendor/bin/phpcs --config-set installed_paths vendor/phpcompatibility/php-compatibility
./vendor/bin/phpcs -p . \
    --extensions=php \
    --ignore=*/vendor/*,*wp-includes*,*wp-admin*,*xmlrpc.php*,*wp-trackback.php*,*wp-signup.php*,*wp-settings.php*,*wp-mail.php*,*wp-login.php*,*wp-load.php*,*wp-links-opml.php*,*wp-cron.php*,*wp-config-sample.php*,*wp-comments-post.php*,*wp-blog-header.php*,*wp-activate.php* \
    --standard=PHPCompatibility \
    --runtime-set testVersion 7.3 \
    --report=source \
    --warning-severity=0 --error-severity=1 \
    --report-full=./PHPCompatibilityReport73.txt