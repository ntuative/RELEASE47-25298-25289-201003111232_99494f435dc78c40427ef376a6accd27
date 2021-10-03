package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1482:String;
      
      private var var_935:String;
      
      private var var_1480:String;
      
      private var var_1481:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1481 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1482 = _loc5_[0];
         var_1480 = _loc5_[1];
         _name = param2;
         var_935 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1482;
      }
      
      public function get languageCode() : String
      {
         return var_1481;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_935;
      }
      
      public function get encoding() : String
      {
         return var_1480;
      }
      
      public function get id() : String
      {
         return var_1481 + "_" + var_1482 + "." + var_1480;
      }
   }
}
