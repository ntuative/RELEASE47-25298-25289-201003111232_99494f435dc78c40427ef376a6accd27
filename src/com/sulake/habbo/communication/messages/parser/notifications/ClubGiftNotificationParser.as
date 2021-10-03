package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ClubGiftNotificationParser implements IMessageParser
   {
       
      
      private var var_2116:int;
      
      public function ClubGiftNotificationParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2116 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get numGifts() : int
      {
         return var_2116;
      }
   }
}
