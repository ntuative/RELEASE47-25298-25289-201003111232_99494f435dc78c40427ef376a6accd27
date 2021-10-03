package com.sulake.habbo.communication.messages.parser.room.publicroom
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ParkBusDoorMessageParser implements IMessageParser
   {
       
      
      private var var_368:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function ParkBusDoorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_368 = 0;
         _roomId = 0;
         _roomCategory = 0;
         return true;
      }
      
      public function get status() : int
      {
         return var_368;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_368 = param1.readInteger();
         return true;
      }
   }
}
