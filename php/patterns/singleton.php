<?php
class Singleton {
	
	private static $instance = null;

	private function __construct() {}
	private function __clone() {}
	
	public static function getInstance() {
		if(self::$instance === null) {
			self::$instance = new Registry();
		} 
		return self::$instance;
	}
}
 
//usage
$test = Singleton::getInstance();