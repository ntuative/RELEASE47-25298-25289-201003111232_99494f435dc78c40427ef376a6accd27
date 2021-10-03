package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1114:int;
      
      private var var_1060:String;
      
      private var var_739:Array;
      
      private var var_943:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_739.slice();
      }
      
      public function flush() : Boolean
      {
         var_1060 = "";
         var_943 = [];
         var_739 = [];
         var_1114 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1114;
      }
      
      public function get question() : String
      {
         return var_1060;
      }
      
      public function get choices() : Array
      {
         return var_943.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1060 = param1.readString();
         var_943 = [];
         var_739 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_943.push(param1.readString());
            var_739.push(param1.readInteger());
            _loc3_++;
         }
         var_1114 = param1.readInteger();
         return true;
      }
   }
}
