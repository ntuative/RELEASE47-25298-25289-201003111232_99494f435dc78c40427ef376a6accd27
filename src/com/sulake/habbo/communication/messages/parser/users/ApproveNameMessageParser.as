package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ApproveNameMessageParser implements IMessageParser
   {
       
      
      private var _result:int;
      
      public function ApproveNameMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _result = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         _result = -1;
         return true;
      }
      
      public function get result() : int
      {
         return _result;
      }
   }
}
