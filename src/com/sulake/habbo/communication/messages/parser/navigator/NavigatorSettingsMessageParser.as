package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NavigatorSettingsMessageParser implements IMessageParser
   {
       
      
      private var var_2126:int;
      
      public function NavigatorSettingsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2126 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get homeRoomId() : int
      {
         return var_2126;
      }
   }
}
