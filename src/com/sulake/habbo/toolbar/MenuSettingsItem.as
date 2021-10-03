package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1863:Array;
      
      private var var_1862:String;
      
      private var var_1861:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1862 = param1;
         var_1863 = param2;
         var_1861 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1862;
      }
      
      public function get yieldList() : Array
      {
         return var_1863;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1861;
      }
   }
}
