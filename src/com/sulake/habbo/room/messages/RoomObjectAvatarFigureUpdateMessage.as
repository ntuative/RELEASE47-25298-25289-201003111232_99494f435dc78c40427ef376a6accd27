package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1733:String;
      
      private var var_563:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_563 = param1;
         var_1733 = param2;
      }
      
      public function get race() : String
      {
         return var_1733;
      }
      
      public function get figure() : String
      {
         return var_563;
      }
   }
}
