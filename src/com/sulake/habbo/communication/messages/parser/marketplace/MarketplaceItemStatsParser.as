package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1550:Array;
      
      private var var_1690:int;
      
      private var var_1969:int;
      
      private var var_1968:int;
      
      private var var_1970:int;
      
      private var _dayOffsets:Array;
      
      private var var_1967:int;
      
      private var var_1551:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1550;
      }
      
      public function get furniTypeId() : int
      {
         return var_1969;
      }
      
      public function get historyLength() : int
      {
         return var_1970;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1968;
      }
      
      public function get offerCount() : int
      {
         return var_1967;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1551;
      }
      
      public function get averagePrice() : int
      {
         return var_1690;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1690 = param1.readInteger();
         var_1967 = param1.readInteger();
         var_1970 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1550 = [];
         var_1551 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1550.push(param1.readInteger());
            var_1551.push(param1.readInteger());
            _loc3_++;
         }
         var_1968 = param1.readInteger();
         var_1969 = param1.readInteger();
         return true;
      }
   }
}
