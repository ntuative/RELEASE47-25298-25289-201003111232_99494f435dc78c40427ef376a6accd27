package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ObjectDataUpdateMessageParser implements IMessageParser
   {
       
      
      private var _data:String;
      
      private var var_35:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int = 0;
      
      public function ObjectDataUpdateMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:String = param1.readString();
         _id = int(_loc2_);
         _data = param1.readString();
         var _loc3_:Number = parseFloat(_data);
         if(!isNaN(_loc3_))
         {
            var_35 = int(_data);
         }
         return true;
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function flush() : Boolean
      {
         var_35 = 0;
         _data = "";
         _roomId = 0;
         _roomCategory = 0;
         return true;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get id() : int
      {
         return _id;
      }
   }
}
