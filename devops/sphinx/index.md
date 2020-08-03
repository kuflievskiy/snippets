## Install sphinxsearch

```bash
sudo apt-get install mysql-client unixodbc libpq5
sudo dpkg -i sphinxsearch_2.1.9-release-1_amd64.deb
# or
sudo apt-get install sphinxsearch
```

## /etc/default/sphinxsearch

```bash
sudo vim /etc/default/sphinxsearch
# set `yes` instead of 'no'
```

## Create config file /etc/sphinxsearch/sphinx.conf
```bash
sudo vim /etc/sphinxsearch/sphinx.conf
```

<a href="/snippets/devops/sphinx/sphinx.conf.sample" title="sphinx.conf.sample" target="blank">sphinx.conf.sample</a>

## Stop, index and start sphinxsearch

```bash
sudo systemctl stop sphinxsearch.service
sudo indexer --all
sudo systemctl start sphinxsearch.service
```

## Setup cron job to index the database at midnight

```bash
crontab -e
0 0 * * * /usr/bin/indexer --rotate --config /etc/sphinxsearch/sphinx.conf --all
```

