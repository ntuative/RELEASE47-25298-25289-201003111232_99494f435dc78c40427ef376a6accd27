package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_958:Boolean;
      
      private var _name:String;
      
      private var var_1694:String;
      
      private var var_959:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1694 = String(param1.@link);
         var_959 = Boolean(parseInt(param1.@fliph));
         var_958 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_959;
      }
      
      public function get flipV() : Boolean
      {
         return var_958;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1694;
      }
   }
}
