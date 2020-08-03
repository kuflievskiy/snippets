
##################################################################################################
# TESTS
##################################################################################################

```
php vendor/codeception/codeception/codecept g:feature acceptance login
php vendor/codeception/codeception/codecept gherkin:snippets acceptance login.feature
php vendor/codeception/codeception/codecept dry-run acceptance login.feature
php vendor/codeception/codeception/codecept gherkin:steps acceptance
php vendor/codeception/codeception/codecept run -g login --html --debug --colors --steps
```

# run some separate feature scenario
```
php vendor/codeception/codeception/codecept run acceptance login.feature --html --debug --colors --steps --env chrome
```

## install chromium-browser
```
sudo apt-get install chromium-browser
/usr/lib/chromium-browser/chromium-browser --version
Chromium 65.0.3325.181
```

## install chromium-chromedriver
```
sudo apt-get install chromium-chromedriver
sudo ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/chromedriver

chromedriver --version
ChromeDriver 2.35 (0)
```

## install chromium-chromedriver (variant 2)
```
wget -N http://chromedriver.storage.googleapis.com/2.26/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
sudo mv -f chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
```

## run chromedriver
```
chromedriver --url-base=/wd/hub
```

samples:

https://github.com/edno/codeception-gherkin-param/blob/master/tests/acceptance/GherkinParam.feature
https://github.com/llvdl/dominoes-slim/tree/252519252e3cd884ab702f9e6390ab265eb36bff


Selenium + codeception + IE:

- There is now an available workaround for this issue. It requires editing the registry.
To work around the issue, create a DWORD value with the name "iexplore.exe" and the
value of 0 in the following key (for 32-bit Windows):

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE

For 64-bit Windows installations, the following key should be used:

HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE

This will work around the "Unable to get browser" errors, and should, in the main,
resolve the unsupported issues with IE11. I will be updating the wiki page on this
within the next few days as the opportunity presents itself.

- IEDriverServer according to selenium version - http://selenium-release.storage.googleapis.com/index.html
- Add website url in Internet Options -> Security -> Trusted sites

- run selenium server
start java -Dwebdriver.chrome.driver=%CHROME_DRIVER_PATH% -Dwebdriver.gecko.driver=%GECKO_DRIVER_PATH% -Dwebdriver.ie.driver=%IE_DRIVER_PATH% -jar %SELENIUM_SERVER_PATH%

у меня это все работает на selenium 3.0.1