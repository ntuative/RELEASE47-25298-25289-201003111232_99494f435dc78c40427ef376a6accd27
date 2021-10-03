package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_563:String;
      
      private var var_1627:int;
      
      private var var_2066:String;
      
      private var var_997:int;
      
      private var var_1116:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1116;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1116 = param1.readInteger();
         var_2066 = param1.readString();
         var_1627 = param1.readInteger();
         var_563 = param1.readString();
         var_997 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2066;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_563;
      }
      
      public function get petType() : int
      {
         return var_997;
      }
      
      public function get level() : int
      {
         return var_1627;
      }
   }
}
