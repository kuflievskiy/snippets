# https://github.com/gregzem/aibolit

```bash

git clone https://github.com/gregzem/aibolit.git

vim aibolit/src/ai-bolit.php
define('LANG', 'EN');
//define('LANG', 'RU');

php aibolit/src/ai-bolit.php -p . --mode=1 -o report.json --no-html --delay=5 --all


php ~/aibolit/ai-bolit/ai-bolit.php -p ~/ --mode=1 -o ~/report.json --no-html --delay=5 --all

php ai-bolit-en/ai-bolit/ai-bolit.php -p ~/ --mode=1 -o ~/report.json --no-html --delay=5 --all

php ai-bolit-en/ai-bolit/ai-bolit.php -p index.php --mode=1 -o report.json --no-html --delay=5 --all

php ai-bolit-en/ai-bolit/ai-bolit.php -p . --mode=1 -o report.json --no-html --delay=5 --all

php ai-bolit/ai-bolit/ai-bolit.php --mode=1 --report=test@gmail.com
```
