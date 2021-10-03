package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_829:String = "select_outfit";
       
      
      private var var_2145:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_829);
         var_2145 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2145;
      }
   }
}
