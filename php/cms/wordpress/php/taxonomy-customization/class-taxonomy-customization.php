<?php

/*

function myTemplateSelect() {
    if (is_category() ) {
	global $wp_query;

	global $wpdb;
	
		//$options = $wpdb->get_results('SELECT * FROM wp_category_cfields');
		//print_r( $options );exit;
	
		$taxon = new Taxonomy_Customization_Dao();
		$taxon->table_name = 'wp_' . 'category'. '_cfields';
		$cat_options = maybe_unserialize( $taxon->get_ctax_options( $wp_query->queried_object->cat_ID ) );
		
		if( isset( $cat_options['select'] ) ) {
			if( 'custom-posts-category.php' === $cat_options['select'] ) {
				$template = dirname(__FILE__) . '/' . 'custom-posts-category.php';		
				load_template( $template );
				exit;				
			}
		}
    }
}

add_action('template_redirect', 'myTemplateSelect');

*/

require_once 'class-taxonomy-customization-DAO.php';
/*
 * Class TaxonomyCustomization
 * @version 1.0
 * @author <kuflievskiy@gmail.com>
 */

class TaxonomyCustomization extends Taxonomy_Customization_Dao{
    
    /**
     * Function 
     * This function is used for 
     * 
     * @param
     * @return
     * 
     */
    public $custom_fields;
    
    public function __construct( $taxonomy_name, $custom_fields ) {
                
        $this->custom_fields = $custom_fields;
        parent::__construct();
        
        add_action( $taxonomy_name.'_edit_form_fields', array($this,'product_categories_customization_edit'));
        add_action( $taxonomy_name.'_add_form_fields', array($this,'product_categories_customization_add'));                
        $this->create_table( $taxonomy_name, $custom_fields );        
        add_action('edited_terms', array($this, 'add_cust_tax_opt_save'), 10, 1);        
    }
    
    /**
     * Function 
     * This function is used for 
     * 
     * @param
     * @return
     * 
     */    
    public function product_categories_customization_add( $taxonomy ){
        $this->output_taxonomy_custom_fields( the_category_ID(), $taxonomy );
    }


    /**
     * Function 
     * This function is used for 
     * 
     * @param
     * @return
     * 
     */    
    public function product_categories_customization_edit( $taxonomy_data ){

        $t_id    = $taxonomy_data->term_id; // Get the ID of the term you're editing
        $this->output_taxonomy_custom_fields( $t_id, $taxonomy_data->taxonomy );
    }
    

    /**
     * Function 
     * This function is used for 
     * 
     * @param
     * @return
     * 
     */    
    public function output_taxonomy_custom_fields( $tax_id, $taxonomy ){

       $options = maybe_unserialize( parent::get_ctax_options( $tax_id ) );
       \formsGenerator::generate($this->custom_fields, $options, 'tax_options' , true);
       ?>
       <script>
           jQuery(document).ready(function() {                  
                jQuery('#edittag').attr('enctype','multipart/form-data');
           });
       </script>
       <?php        
    }
    

    /**
     * Function add_cust_tax_opt_save
     * This function is used for adding custom fields for taxonomies via hook 'edited_terms'
     * 
     * @param $term_id
     * @return -
     * 
     */
    public function add_cust_tax_opt_save( $tax_id ) {

        $prev_data = maybe_unserialize(parent::get_ctax_options($tax_id));
        
        $options = \formsGenerator::save($prev_data, 'tax_options');
          
        $data = maybe_serialize($options);
    
       if( $this->is_row_exist( $tax_id ) ){           
           $this->update_field( $tax_id, $data );  
       }else{           
           $this->insert_field( $tax_id, $data );
       }
    }
    
    
    public function get_ctax_options($tax_id){
        
        return maybe_unserialize(parent::get_ctax_options($tax_id));
    }

}
        
$options = array(
                array(
                    'type' => 'header',
                    'name' => 'h2',
                    'title' => __('Category Image:', 'some-domain')
                ),    
                 array(
                    'type' => 'image',
                    'name' => 'category_image',
                    'title' => __('Category Image:', 'some-domain')
                ),    
                array(
                    'type' => 'header',
                    'name' => 'h2',
                    'title' => __('Category Slider:', 'some-domain')
                ),
                array(
                        'name' => 'slider_taxonomy',
                        'type' => 'table',
                        'title' => 'Table 1',
                        'fields' => array(
                            array(
                                'name' => 'slide_title',
                                'type' => 'textinput',
                                'title' => 'Slide title',
                                'desc' => 'title'
                            ),
                            array(
                                'name' => 'slide_readmore',
                                'type' => 'textinput',
                                'title' => 'Readmore Link',
                                'desc' => 'title'
                            ),                            
                            array(
                                'type' => 'image',
                                'name' => 'image',
                                'title' => __('Image', 'some-domain'),
                                'desc' => __('Prefered size 803 x 348', 'some-domain')
                            )
                        )
                 )
                

            );
$tax_custom = new TaxonomyCustomization('product_category', $options );