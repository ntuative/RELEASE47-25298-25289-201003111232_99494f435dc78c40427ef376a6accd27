package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1030:Array;
      
      private var var_1116:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1116 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_1030 = new Array();
         while(_loc2_-- > 0)
         {
            var_1030.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return var_1030;
      }
      
      public function get petId() : int
      {
         return var_1116;
      }
      
      public function flush() : Boolean
      {
         var_1116 = -1;
         var_1030 = null;
         return true;
      }
   }
}
