package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetPetCommandsMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_1116:int;
      
      public function GetPetCommandsMessageComposer(param1:int, param2:int = 0, param3:int = 0)
      {
         super();
         var_1116 = param1;
         _roomId = param2;
         _roomCategory = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1116];
      }
      
      public function dispose() : void
      {
      }
   }
}
