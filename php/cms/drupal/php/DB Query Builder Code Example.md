############################################################################################################################
DB Query Builder Code Example
############################################################################################################################

    $query = \Drupal::database()->select('node_field_data', 'nfd');
    $query->fields('nfd', ['nid', 'title', 'status', 'created', 'changed', 'unpublish_on','	publish_on']);

    $query->condition('nfd.type', 'business');
    //$query->condition('nfd.status', '1');

    // desc
    $query->addField('node__body', 'body_value', 'description');
    $query->join('node__body', 'node__body', 'node__body.entity_id = nfd.nid');

    // "address1"
    $query->addField('field_address', 'field_address_value', 'address1');
    $query->leftJoin('node__field_address', 'field_address', 'field_address.entity_id = nfd.nid');

    // "lat"
    $query->addField('fg', 'field_geolocation_lat', 'lat');
    $query->leftJoin('node__field_geolocation', 'fg', 'fg.entity_id = nfd.nid');

    // "lng"
    $query->addField('fg_lng', 'field_geolocation_lng', 'lng');
    $query->leftJoin('node__field_geolocation', 'fg_lng', 'fg_lng.entity_id = nfd.nid');

    // "url"
    $query->addField('field_website_address', 'field_website_address_value', 'url');
    $query->leftJoin('node__field_website_address', 'field_website_address', 'field_website_address.entity_id = nfd.nid');

    // "images"
    $query->addExpression('
      ( SELECT
        GROUP_CONCAT(file_managed.uri separator \'|\') AS images
        FROM
          paragraphs_item_field_data
         INNER JOIN paragraphs_item ON paragraphs_item.revision_id = paragraphs_item_field_data.revision_id
         INNER JOIN paragraph__field_image ON paragraph__field_image.entity_id = paragraphs_item.id
         INNER JOIN file_managed ON file_managed.fid = paragraph__field_image.field_image_target_id AND file_managed.filemime IN (\'image/png\',\'image/jpeg\',\'image/gif\') AND file_managed.status = 1
        WHERE paragraphs_item_field_data.parent_id = nfd.nid
        )
        ', 'images'
    );

    // "city"
    $query->addField('field_city_name', 'field_city_name_value', 'city');
    $query->leftJoin('node__field_city_name', 'field_city_name', 'field_city_name.entity_id = nfd.nid');

    // "zip"
    $query->addField('field_zip_code', 'field_zip_code_value', 'zip');
    $query->leftJoin('node__field_zip_code', 'field_zip_code', 'field_zip_code.entity_id = nfd.nid');

    // "phone"
    $query->addField('field_phone', 'field_first_phone_value', 'phone');
    $query->leftJoin('node__field_first_phone', 'field_phone', 'field_phone.entity_id = nfd.nid');

    // 'additional_phone'
    $query->addField('field_secondary_phone', 'field_secondary_phone_value', 'additional_phone');
    $query->leftJoin('node__field_secondary_phone', 'field_secondary_phone', 'field_secondary_phone.entity_id = nfd.nid');

    // "email"
    $query->addField('field_email_field', 'field_email_field_value', 'email');
    $query->leftJoin('node__field_email_field', 'field_email_field', 'field_email_field.entity_id = nfd.nid');

    // "booking_url"
    $query->addField('field_book', 'field_book_value', 'booking_url');
    $query->leftJoin('node__field_book', 'field_book', 'field_book.entity_id = nfd.nid');

    // "state": "CA",
    $query->addField('field_state_name', 'field_state_name_value', 'state');
    $query->leftJoin('node__field_state_name', 'field_state_name', 'field_state_name.entity_id = nfd.nid');

    // category_id
    // additional_categories
    $query->addExpression('
      ( SELECT GROUP_CONCAT(node__field_sub_category.field_sub_category_target_id, \',\', taxonomy_term_hierarchy.parent separator \'|\') AS categories
        FROM {node__field_sub_category} node__field_sub_category
        INNER JOIN {taxonomy_term_hierarchy} taxonomy_term_hierarchy ON taxonomy_term_hierarchy.tid = node__field_sub_category.field_sub_category_target_id        
        WHERE node__field_sub_category.entity_id = nfd.nid
        )
        ', 'categories'
    );

    // business_amenities
    $query->addExpression('
      ( SELECT GROUP_CONCAT(taxonomy_term_field_data.name separator \'|\') AS attributes
        FROM {node__field_business_amenities} node__field_business_amenities
        INNER JOIN taxonomy_term_field_data ON taxonomy_term_field_data.tid = node__field_business_amenities.field_business_amenities_target_id
        WHERE node__field_business_amenities.entity_id = nfd.nid
        )
        ', 'attributes'
    );

    // Filter content based on domain alias.
    $moduleHandler = \Drupal::service('module_handler');

    if ($moduleHandler->moduleExists('domain_access')) {

      /** @var \Drupal\domain\Entity\Domain $active */
      //$active = \Drupal::service('domain.negotiator')->getActiveDomain();

      //if (empty($active)) {
      //  $active = \Drupal::service('domain.loader')->loadDefaultDomain();
      //}

      //$field_domain_access_target_id = $active->getOriginalId();

      $query->addField('field_domain_access', 'field_domain_access_target_id');
      $query->leftJoin('node__field_domain_access', 'field_domain_access', "field_domain_access.entity_id = nfd.nid AND field_domain_access_target_id = '" . $field_domain_access_target_id . "'");

      $query->addField('domain_all_affiliates', 'field_domain_all_affiliates_value');
      $query->leftJoin('node__field_domain_all_affiliates', 'domain_all_affiliates', 'domain_all_affiliates.entity_id = nfd.nid');

      $query->where("field_domain_all_affiliates_value = 1 OR field_domain_access_target_id = '$field_domain_access_target_id'");
    }

    $query->orderBy('nfd.title','asc');

    $businessItems = $query->execute()->fetchAll();