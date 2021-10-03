package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1034:int;
      
      private var var_1260:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1034 = param1;
         var_1260 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1034;
      }
      
      public function get itemName() : String
      {
         return var_1260;
      }
   }
}
