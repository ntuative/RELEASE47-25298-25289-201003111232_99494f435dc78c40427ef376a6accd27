package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetAddedToInventoryParser implements IMessageParser
   {
       
      
      private var var_1058:PetData;
      
      private var var_1695:Boolean;
      
      public function PetAddedToInventoryParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1058 = null;
         return true;
      }
      
      public function get purchased() : Boolean
      {
         return var_1695;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1058 = new PetData(param1);
         var_1695 = param1.readBoolean();
         return true;
      }
      
      public function get pet() : PetData
      {
         return var_1058;
      }
   }
}
