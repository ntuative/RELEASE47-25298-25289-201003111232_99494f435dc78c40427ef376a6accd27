package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_70:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_215:Vector3d = null;
      
      private var var_1647:int = 0;
      
      private var var_2071:String = null;
      
      private var _category:int = 0;
      
      private var var_2070:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2070 = param3;
         var_70 = new Vector3d();
         var_70.assign(param4);
         var_215 = new Vector3d();
         var_215.assign(param5);
         var_1647 = param6;
         var_2071 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_70;
      }
      
      public function get typeId() : int
      {
         return var_1647;
      }
      
      public function get dir() : Vector3d
      {
         return var_215;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2071;
      }
      
      public function get operation() : String
      {
         return var_2070;
      }
      
      public function dispose() : void
      {
         var_70 = null;
         var_215 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
