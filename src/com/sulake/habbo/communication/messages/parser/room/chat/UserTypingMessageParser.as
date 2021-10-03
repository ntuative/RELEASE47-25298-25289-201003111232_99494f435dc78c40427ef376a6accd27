package com.sulake.habbo.communication.messages.parser.room.chat
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserTypingMessageParser implements IMessageParser
   {
       
      
      private var var_508:Boolean = false;
      
      private var _userId:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function UserTypingMessageParser()
      {
         super();
      }
      
      public function get isTyping() : Boolean
      {
         return var_508;
      }
      
      public function flush() : Boolean
      {
         _roomId = 0;
         _roomCategory = 0;
         _userId = 0;
         var_508 = false;
         return true;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         _userId = param1.readInteger();
         var_508 = param1.readInteger() == 1;
         return true;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
   }
}
