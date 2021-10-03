package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_65:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1091:int;
      
      private var _color:uint;
      
      private var var_1092:int;
      
      private var var_1608:int;
      
      private var var_35:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_65,param6,param7);
         var_35 = param1;
         var_1608 = param2;
         var_1091 = param3;
         _color = param4;
         var_1092 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1092;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1091;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function get presetId() : int
      {
         return var_1608;
      }
   }
}
