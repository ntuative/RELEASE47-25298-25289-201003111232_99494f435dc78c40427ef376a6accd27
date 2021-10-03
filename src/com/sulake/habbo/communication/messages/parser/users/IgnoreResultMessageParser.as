package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class IgnoreResultMessageParser implements IMessageParser
   {
       
      
      protected var _result:int;
      
      public function IgnoreResultMessageParser()
      {
         super();
         _result = -1;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _result = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get result() : int
      {
         return _result;
      }
   }
}
