#### Drupal "system.site" uuid
#### drush config-get "system.site" / drush config-set "system.site"

```
cat config/sync/system.site.yml 
drush config-get "system.site" uuid
drush config-set "system.site" uuid "17745b58-2dd1-430e-a726-d356d7d3327d"
```

#### D8 deploy scenario "import the configuration on a different site"
````bash
# get UUID on the source site
drush config-get "system.site" uuid
drush config-export --destination config-export

# set UUID on the destination site
drush config-set "system.site" uuid "fjfj34-e3bb-2ab8-4d21-9100-b5etgetgd99d5"
drush config-import --source config-export
````


#### Create custom content-type

```bash
drupal generate:entity:content  \
--module="modulename"  \
--entity-class="DefaultEntity"  \
--entity-name="default_entity"  \
--base-path="/admin/structure"  \
--label="Default entity"


drupal generate:entity:content  \
--module="modulename"  \
--entity-class="DefaultEntity"  \
--entity-name="default_entity"  \
--base-path="/admin/structure"  \
--label="Default entity"  \
--is-translatable  \
--revisionable
```

```bash
drush user-password test@gmail.com testpassword
```

#### Print template variables

````twig
{{ dump(_context|keys) }}
````

drush user-create adminuser --mail="xxx@gmail.com" --password="123"; drush user-add-role "administrator" adminuser