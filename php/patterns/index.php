<?php
	class Member {
	  
	  public $username = "";
	  private $loggedIn = false;
	  
	  
	  public function login() {
		$this->loggedIn = true;
		
		echo $this->username;
		echo " has logged in!<br/>";
		
	  }
	  public function logout() {
		$this->loggedIn = false;
	  }

	}

	  
	final class Administrator extends Member {

	  public function login() {
		parent::login();
		echo "Log entry: $this->username logged in<br>";
	  }
	}


	$member = new Member();
	$member->username = "Fred";
	$member->login();
	$member->logout();


	$admin = new Administrator();
	$admin->username = "Mary";
	$admin->login();         // отобразит "Log entry: Mary logged in"
	$admin->logout();

?>