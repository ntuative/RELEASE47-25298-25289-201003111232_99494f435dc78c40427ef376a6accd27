package com.sulake.habbo.communication.messages.parser.room.chat
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ChatMessageParser implements IMessageParser
   {
       
      
      private var _userId:int = 0;
      
      private var var_189:String = "";
      
      private var var_1292:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function ChatMessageParser()
      {
         super();
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function flush() : Boolean
      {
         _roomId = 0;
         _roomCategory = 0;
         _userId = 0;
         var_189 = "";
         var_1292 = 0;
         return true;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get gesture() : int
      {
         return var_1292;
      }
      
      public function get text() : String
      {
         return var_189;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         _userId = param1.readInteger();
         var_189 = param1.readString();
         var_1292 = param1.readInteger();
         return true;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
