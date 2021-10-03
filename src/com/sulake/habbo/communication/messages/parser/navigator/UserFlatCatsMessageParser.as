package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   
   public class UserFlatCatsMessageParser implements IMessageParser
   {
       
      
      private var var_1024:Array;
      
      public function UserFlatCatsMessageParser()
      {
         super();
      }
      
      public function get nodes() : Array
      {
         return var_1024;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1024 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1024.push(new FlatCategory(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1024 = null;
         return true;
      }
   }
}
