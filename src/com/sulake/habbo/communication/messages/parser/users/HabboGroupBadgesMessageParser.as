package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class HabboGroupBadgesMessageParser implements IMessageParser
   {
       
      
      protected var var_250:Map;
      
      public function HabboGroupBadgesMessageParser()
      {
         super();
         var_250 = new Map();
      }
      
      public function get badges() : Map
      {
         var _loc1_:Map = new Map();
         var _loc2_:int = 0;
         while(_loc2_ < var_250.length)
         {
            _loc1_.add(var_250.getKey(_loc2_),var_250.getWithIndex(_loc2_));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var_250.dispose();
         var_250 = new Map();
         var _loc2_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = param1.readInteger();
            _loc4_ = param1.readString();
            var_250.add(_loc3_,_loc4_);
            _loc5_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
