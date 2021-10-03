package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2223:int;
      
      private var var_1314:String;
      
      private var var_2221:int;
      
      private var var_2219:int;
      
      private var var_2220:int;
      
      private var var_2222:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1314;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2222;
      }
      
      public function get responseType() : int
      {
         return var_2219;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2221;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1314 = param1.readString();
         var_2221 = param1.readInteger();
         var_2223 = param1.readInteger();
         var_2220 = param1.readInteger();
         var_2219 = param1.readInteger();
         var_2222 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_2223;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2220;
      }
   }
}
