package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_581:Array;
      
      private var var_1146:int;
      
      private var var_1526:Array;
      
      private var var_582:Array;
      
      private var var_1886:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1886 = _loc2_.isWrappingEnabled;
         var_1146 = _loc2_.wrappingPrice;
         var_1526 = _loc2_.stuffTypes;
         var_582 = _loc2_.boxTypes;
         var_581 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_581;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1526;
      }
      
      public function get price() : int
      {
         return var_1146;
      }
      
      public function get boxTypes() : Array
      {
         return var_582;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1886;
      }
   }
}
