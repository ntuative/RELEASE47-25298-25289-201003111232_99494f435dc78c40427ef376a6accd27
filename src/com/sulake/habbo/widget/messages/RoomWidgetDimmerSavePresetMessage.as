package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_688:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1888:int;
      
      private var var_1887:int;
      
      private var var_1889:Boolean;
      
      private var var_1092:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_688);
         var_1887 = param1;
         var_1888 = param2;
         _color = param3;
         var_1092 = param4;
         var_1889 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1888;
      }
      
      public function get presetNumber() : int
      {
         return var_1887;
      }
      
      public function get brightness() : int
      {
         return var_1092;
      }
      
      public function get apply() : Boolean
      {
         return var_1889;
      }
   }
}
