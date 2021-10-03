package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class FurnitureGiftWrappedVisualization extends FurnitureVisualization
   {
       
      
      private var var_2091:int = 0;
      
      private var var_2092:int = 0;
      
      public function FurnitureGiftWrappedVisualization()
      {
         super();
      }
      
      private function updateTypes() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:IRoomObject = object;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getModel();
            if(_loc2_ != null)
            {
               _loc3_ = 1000;
               _loc4_ = _loc2_.getString(RoomObjectVariableEnum.const_426);
               _loc5_ = parseInt(_loc4_);
               var_2091 = Math.floor(_loc5_ / _loc3_);
               var_2092 = _loc5_ % _loc3_;
            }
         }
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         if(param1 <= 1)
         {
            return var_2091;
         }
         return var_2092;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         updateTypes();
         super.update(param1,param2);
      }
      
      override protected function getSpriteAssetName(param1:int, param2:Number) : String
      {
         if(_data == null)
         {
            return "";
         }
         var _loc3_:int = _data.getSize(param2);
         var _loc4_:String = _type;
         var _loc5_:String = "";
         if(param1 < spriteCount - 1)
         {
            _loc5_ = String.fromCharCode("a".charCodeAt() + param1);
         }
         else
         {
            _loc5_ = "sd";
         }
         var _loc6_:int = getFrameNumber(param1,param2);
         _loc4_ += "_" + _loc3_ + "_" + _loc5_ + "_" + _direction;
         return _loc4_ + ("_" + _loc6_);
      }
   }
}
