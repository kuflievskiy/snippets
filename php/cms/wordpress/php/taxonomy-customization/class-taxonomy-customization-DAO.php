<?php


/*
 * 
 * 
 * 
 */
class Taxonomy_Customization_Dao{
    

    public $db;
    public $taxonomy;
    public $table_name;
    public $table_custom_taxfields;
    
    public function __construct() {
        
       global $wpdb;
       $this->db = $wpdb;
        
    }
        
    /**
     * Function create_table
     * This function is used for adding tables for each custom taxonomy
     * 
     * @param   $taxonomy
     * @param   $custom_fields
     * 
     * @return  -
     * 
     */      
    public function create_table( $taxonomy, $custom_fields ){ 
        
        $this->taxonomy = $taxonomy;
        
        $this->table_name = $this->db->prefix . $taxonomy . '_cfields';
        $tables_exists = $this->db->get_col("SHOW TABLES;", 0, ARRAY_A);
        

        if (is_array($tables_exists)) {
            
            if (!in_array($this->table_name, $tables_exists)) {
                

                $sql = "CREATE TABLE IF NOT EXISTS `{$this->table_name}` (
                  `id` bigint(20) NOT NULL AUTO_INCREMENT,
                  `tax_id` bigint(20) NOT NULL,
                  `options` text NOT NULL,
                  PRIMARY KEY (`id`)
                ) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

                $this->db->query($sql);

            }
            
            
        }                
    }
    

    
    
    /**
     * Function get_query_results
     * This function is used for 
     * 
     * @param $term_id
     * @return
     * 
     */          
    public function get_query_results($tax_id) {       

        return $this->db->get_results("SELECT * FROM `{$this->table_name}` WHERE tax_id='{$tax_id}' ;", ARRAY_A);  // get data

    }
    
    /**
     * Function get_query_row
     * This function is used for 
     * 
     * @param $t_id
     * @param $field_name
     * 
     * @return
     * 
     */          
    public function get_query_row( $tax_id ) {        
        return $this->db->get_row("SELECT * FROM `{$this->table_name}` WHERE tax_id='{$$tax_id}';");  // get data        
    }

    
    /**
     * Function update_field
     * This function is used for 
     * 
     * @param $term_id
     * @param $field_name
     * @param $field_value
     * 
     * @return
     * 
     */          
    public function update_field( $tax_id, $options ){        
        return $this->db->query("UPDATE `{$this->table_name}` SET `options` = '{$options}' WHERE  `tax_id` = '{$tax_id}';");  // get data       
    }
    
    
    

    public function insert_field( $tax_id, $options ){

        $return = $this->db->query("INSERT INTO  `{$this->table_name}` (
                                                                        `id` ,
                                                                        `tax_id` ,
                                                                        `options`
                                                                        )
                                                                        VALUES (
                                                                        NULL ,  '{$tax_id}',  '{$options}'
                                                                        );");  // get data
        return $return;
        
    }
    
    /**
     * Function is_row_exist
     * This function is used for 
     * 
     * @param $term_id
     * @param $field_name
     * 
     * @return
     * 
     */           
    public function is_row_exist( $tax_id ){

        $return = $this->db->query("SELECT * FROM  `{$this->table_name}` WHERE  `tax_id` = '{$tax_id}';");  // get data       
        return $return;
        
    }
    
    /**
     * Function get_ctax_field_value
     * This function is used for
     * 
     * @param $term_id
     * @param $field_name
     * 
     * @return 
     * 
     */    /*
    public function get_ctax_options( $tax_id ){        
        
        global $wpdb;
        return $wpdb->get_var("SELECT  `{$this->table_name}`.`options` 
                               FROM  `{$this->table_name}`
                               WHERE `tax_id` = '{$tax_id}';");
        
    }
    
    */

    public function get_ctax_options( $tax_id ){        
        
        global $wpdb;        
        return $wpdb->get_var("SELECT  `{$this->table_name}`.`options` 
                               FROM  `{$this->table_name}`
                               WHERE `tax_id` = '{$tax_id}';");
        
    }

    
}

?>
