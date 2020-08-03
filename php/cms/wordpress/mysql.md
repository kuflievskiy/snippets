# https://wordpress.org/support/topic/deleting-post-revisions-do-not-use-the-abc-join-code-you-see-everywhere
# Delete old post revisions.

```sql
DELETE FROM $wpdb->posts WHERE post_type = 'revision';
DELETE FROM $wpdb->postmeta WHERE post_id NOT IN (SELECT ID FROM $wpdb->posts);
```