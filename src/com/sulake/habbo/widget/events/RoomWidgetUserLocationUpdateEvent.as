package com.sulake.habbo.widget.events
{
   import flash.geom.Rectangle;
   
   public class RoomWidgetUserLocationUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_1229:String = "RWULUE_USER_LOCATION_UPDATE";
       
      
      private var _rect:Rectangle;
      
      private var _userId:int;
      
      public function RoomWidgetUserLocationUpdateEvent(param1:int, param2:Rectangle, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_1229,param3,param4);
         _userId = param1;
         _rect = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get rectangle() : Rectangle
      {
         return _rect;
      }
   }
}
