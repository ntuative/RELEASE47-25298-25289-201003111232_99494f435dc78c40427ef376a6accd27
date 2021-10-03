package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1629:int;
      
      private var var_1144:PetData;
      
      private var var_1689:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1629;
      }
      
      public function get petData() : PetData
      {
         return var_1144;
      }
      
      public function flush() : Boolean
      {
         var_1144 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1689;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1629 = param1.readInteger();
         var_1689 = param1.readInteger();
         var_1144 = new PetData(param1);
         return true;
      }
   }
}
