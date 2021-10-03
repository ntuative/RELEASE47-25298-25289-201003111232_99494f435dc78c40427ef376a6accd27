package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1627:int;
      
      private var var_1629:int;
      
      private var var_1632:int;
      
      private var var_1729:int;
      
      private var _nutrition:int;
      
      private var var_1116:int;
      
      private var var_1730:int;
      
      private var var_1735:int;
      
      private var _energy:int;
      
      private var var_1628:int;
      
      private var var_1732:int;
      
      private var _ownerName:String;
      
      private var var_1625:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1627;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1629 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1627 = param1;
      }
      
      public function get petId() : int
      {
         return var_1116;
      }
      
      public function get experienceMax() : int
      {
         return var_1735;
      }
      
      public function get nutritionMax() : int
      {
         return var_1729;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1730 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1625;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1116 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1732;
      }
      
      public function get respect() : int
      {
         return var_1629;
      }
      
      public function get levelMax() : int
      {
         return var_1730;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1735 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1632 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1729 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1625 = param1;
      }
      
      public function get experience() : int
      {
         return var_1632;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1732 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1628 = param1;
      }
      
      public function get age() : int
      {
         return var_1628;
      }
   }
}
