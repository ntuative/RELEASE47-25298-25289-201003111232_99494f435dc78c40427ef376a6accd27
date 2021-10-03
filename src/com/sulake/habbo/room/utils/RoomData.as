package com.sulake.habbo.room.utils
{
   public class RoomData
   {
       
      
      private var var_1153:String = null;
      
      private var _floorType:String = null;
      
      private var _data:XML;
      
      private var _roomId:int;
      
      private var var_1152:String = null;
      
      private var _roomCategory:int;
      
      public function RoomData(param1:int, param2:int, param3:XML)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         _data = param3;
      }
      
      public function set landscapeType(param1:String) : void
      {
         var_1152 = param1;
      }
      
      public function get wallType() : String
      {
         return var_1153;
      }
      
      public function set wallType(param1:String) : void
      {
         var_1153 = param1;
      }
      
      public function get floorType() : String
      {
         return _floorType;
      }
      
      public function get data() : XML
      {
         return _data;
      }
      
      public function set floorType(param1:String) : void
      {
         _floorType = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get landscapeType() : String
      {
         return var_1152;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
