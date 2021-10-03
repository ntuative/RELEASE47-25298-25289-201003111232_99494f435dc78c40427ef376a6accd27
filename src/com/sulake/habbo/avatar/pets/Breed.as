package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_1075:String;
      
      private var _id:int;
      
      private var var_1974:String = "";
      
      private var var_1972:int;
      
      private var var_1973:String;
      
      private var var_1917:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1972 = parseInt(param1.@pattern);
         var_1075 = String(param1.@gender);
         var_1917 = Boolean(parseInt(param1.@colorable));
         var_1974 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1974;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1917;
      }
      
      public function get gender() : String
      {
         return var_1075;
      }
      
      public function get patternId() : int
      {
         return var_1972;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1973;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1973 = param1;
      }
   }
}
