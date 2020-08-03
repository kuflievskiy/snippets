############################################################################################################################
entityQuery Example
############################################################################################################################

  $nids = \Drupal::entityQuery('node')
    ->condition('type', 'in_the_news')
    ->condition('status', 1)
    ->range(0,2)
    ->execute();

  $nodes = \Drupal::entityTypeManager()
    ->getStorage('node')
    ->loadMultiple($nids);