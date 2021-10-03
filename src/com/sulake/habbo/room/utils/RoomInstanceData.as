package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_885:LegacyWallGeometry = null;
      
      private var var_595:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_594:TileHeightMap = null;
      
      private var var_2130:String = null;
      
      private var _roomId:int = 0;
      
      private var var_596:SelectedRoomObjectData = null;
      
      private var var_884:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_885 = new LegacyWallGeometry();
         var_884 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_595 != null)
         {
            var_595.dispose();
         }
         var_595 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_594 != null)
         {
            var_594.dispose();
         }
         var_594 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2130 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_885;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_596;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_884;
      }
      
      public function dispose() : void
      {
         if(var_594 != null)
         {
            var_594.dispose();
            var_594 = null;
         }
         if(var_885 != null)
         {
            var_885.dispose();
            var_885 = null;
         }
         if(var_884 != null)
         {
            var_884.dispose();
            var_884 = null;
         }
         if(var_595 != null)
         {
            var_595.dispose();
            var_595 = null;
         }
         if(var_596 != null)
         {
            var_596.dispose();
            var_596 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_594;
      }
      
      public function get worldType() : String
      {
         return var_2130;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_596 != null)
         {
            var_596.dispose();
         }
         var_596 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_595;
      }
   }
}
