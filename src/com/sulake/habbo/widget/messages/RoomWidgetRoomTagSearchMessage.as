package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_723:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1743:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_723);
         var_1743 = param1;
      }
      
      public function get tag() : String
      {
         return var_1743;
      }
   }
}
