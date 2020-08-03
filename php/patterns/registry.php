<?php
/*

http://avedo.net/101/the-registry-pattern-and-php/

*/
class Registry implements ArrayAccess {


   private $registry = array();


	private static $instance = null;
 
	public static function getInstance() {
	 if(self::$instance === null) {
		self::$instance = new Registry();
	 }

	 return self::$instance;
	}
 
  private function __construct() {}
  private function __clone() {}

  
   public function set($key, $value) {
      if (isset($this->registry[$key])) {
         throw new Exception("There is already an entry for key " . $key);
      }
 
      $this->registry[$key] = $value;
   }
 
   public function get($key) {
      if (!isset($this->registry[$key])) {
         throw new Exception("There is no entry for key " . $key);
      }
 
      return $this->registry[$key];
   }
   
   
   /*
   ArrayAccess methods
   */
   public offsetExists( $key ) {
      return isset($this->registry[$key]);
   }
 
   public offsetGet ( $key ) {
      if(isset($this->registry[$key])) {
         return $this->registry[$key];
      }
 
      return null;
   }
 
   public offsetSet ( $key , $value ) {
      return $this->registry[$key] = $value;
   }
 
   public offsetUnset ( $key ) {
      return unset($this->registry[$key]);
   }
   
}




/*

	$registry = Registry::getInstance();
       
	// ... load the basic config and add it to the registry.
	$registry->set('config', new IniConfiguration('config.ini.php'));
       
	// Then load the database connection parameters, ...
	$db = $registry->get('config')->getSection('database');
 // ... create the pdo mysql string, ...
      $pdoString = "mysql:host=" . $db['host'] . ";dbname=" . $db['name'];
       
      // ... initialize the database connection object ...
      $pdo = new PDO($pdoString, $db['user'], $db['pwd']);
       
      // ... and add it to the registry too.
      $registry->set('pdo', $pdo);
   } catch(Exception $e) {
      echo $e->getMessage();	
*/