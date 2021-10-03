package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_596:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_274:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_596,param2,param3);
         var_274 = param1;
      }
      
      public function get effects() : Array
      {
         return var_274;
      }
   }
}
