<?php
  interface Conveyer
  {
      public function buildEngine(); 
      public function attachWheels(); 
      public function testing();
  }

  class Fast_Car implements Conveyer
  {
      public function buildEngine(){
        echo 'fast car';
      }
      public function attachWheels(){} 
      public function testing(){}
  }
  class Big_Car implements Conveyer
  {
      public function buildEngine(){
        echo 'big car engine';      
      }
      public function attachWheels(){} 
      public function testing(){}
  }

  class Cheap_Car implements Conveyer
  {
      public function buildEngine(){} 
      public function attachWheels(){} 
      public function testing(){}
  }


  class KufFactory
  {
      static function factory($object_type)
      {      
          //$class_name = $object_type; // ��������, �������� ������ � ������ � ��� ���������
          //require ($car . '.php');           
          
          switch ( $object_type ) {
          
            case "toyota" : { 
                              $object = new Fast_Car();
                              break;
                            }
            case "bmw"    : {
                              $object = new Big_Car();
                              break;
                            }
            default:        {
                              $object = new Cheap_Car();
                            }
          }	
          return $object;
      }
  }


  $obj =  KufFactory::factory('bmw');
  $obj->buildEngine();
  $obj->attachWheels();
  $obj->testing();

?>