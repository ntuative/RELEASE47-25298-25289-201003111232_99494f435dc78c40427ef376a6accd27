package com.sulake.habbo.widget.events
{
   public class RoomWidgetTrophyDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_589:String = "RWTDUE_TROPHY_DATA";
       
      
      private var _color:Number;
      
      private var _name:String;
      
      private var var_698:String;
      
      private var _message:String;
      
      public function RoomWidgetTrophyDataUpdateEvent(param1:String, param2:Number, param3:String, param4:String, param5:String, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         _color = param2;
         _name = param3;
         var_698 = param4;
         _message = param5;
      }
      
      public function get color() : Number
      {
         return _color;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get date() : String
      {
         return var_698;
      }
   }
}
