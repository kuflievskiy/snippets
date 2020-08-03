# create a backup
## This way all files are tarred except the .htaccess files.

```bash
tar -cvzf site_backup_`date '+%Y_%m_%d'`.tar.zip --exclude="some.zip" --exclude="some2.zip" *
```

## The solution is actually quite simple: replace the asterisk (*) by a dot (.):
## This way the .htaccess files are included in the tarfile.

```bash
tar -cvzf site_backup_`date '+%Y_%m_%d'`.tar.zip --exclude="some.zip" --exclude="some2.zip" .
```

```bash
# bash backup.bash
# cd /home/dev/www
cd /home/dev/www
for dir in */
do
  base=$(basename "$dir")
  #tar -czf "${base}.tar.gz" "$dir"
  #tar -cvzf "${base}"_backup_`date '+%Y_%m_%d'`.tar.zip --exclude="ddd" --exclude="aaa" *
  tar -cvzf "${base}"_backup_`date '+%Y_%m_%d'`.tar.zip "$dir"
  echo "Backuped : ${base}"
done
```

```bash
rsync -a username@remote_host:/home/username/dir1 place_to_sync_on_local_machine
rsync -avz travis_debug aWQgv46ETduybEAmfejB2Qhqt@nyc1.tmate.io:/home/travis/build/fulldecent/pmtsystem/tests/_output

scp -r /home/dev/www/pmt/wordpress/travis_debug aWQgv46ETduybEAmfejB2Qhqt@nyc1.tmate.io:/home/travis/build/fulldecent/pmtsystem/tests/_output
```