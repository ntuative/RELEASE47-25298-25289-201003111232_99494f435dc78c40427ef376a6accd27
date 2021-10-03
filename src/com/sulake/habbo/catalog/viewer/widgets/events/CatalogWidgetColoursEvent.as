package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1194:Array;
      
      private var var_1678:String;
      
      private var var_1680:String;
      
      private var var_1679:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1194 = param1;
         var_1678 = param2;
         var_1680 = param3;
         var_1679 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1194;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1678;
      }
      
      public function get colourAssetName() : String
      {
         return var_1680;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1679;
      }
   }
}
