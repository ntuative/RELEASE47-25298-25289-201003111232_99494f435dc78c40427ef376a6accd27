package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomObjectUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_109:String = "RWROUE_FURNI_REMOVED";
      
      public static const const_637:String = "RWROUE_USER_ADDED";
      
      public static const const_244:String = "RWROUE_USER_REMOVED";
      
      public static const const_303:String = "RWROUE_OBJECT_SELECTED";
      
      public static const const_219:String = "RWROUE_OBJECT_DESELECTED";
      
      public static const const_575:String = "RWROUE_FURNI_ADDED";
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      public function RoomWidgetRoomObjectUpdateEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         _id = param2;
         _category = param3;
         _roomId = param4;
         _roomCategory = param5;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
