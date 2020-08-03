#### Drupal "system.site" uuid
#### drush config-get "system.site" / drush config-set "system.site"

```
cat config/sync/system.site.yml 
drush config-get "system.site" uuid
drush config-set "system.site" uuid "17745b58-2dd1-430e-a726-d356d7d3327d"
```

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