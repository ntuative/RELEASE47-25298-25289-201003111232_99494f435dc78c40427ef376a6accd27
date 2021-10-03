package com.sulake.habbo.room.object.visualization.room.publicroom
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class PublicRoomParkVisualization extends PublicRoomVisualization
   {
       
      
      private var var_1147:Boolean;
      
      public function PublicRoomParkVisualization()
      {
         super();
         var_1147 = false;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         super.update(param1,param2);
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = object.getModel();
         var _loc5_:int = _loc4_.getNumber(RoomObjectVariableEnum.const_859);
         var _loc6_:Boolean = Boolean(_loc5_);
         if(data != null)
         {
            if(var_1147 != _loc6_)
            {
               _loc7_ = "";
               if(_loc6_)
               {
                  data.layoutRasterizer.changeElementAlpha("bus",0);
                  data.layoutRasterizer.changeElementAlpha("bus_oviopen_hidden",255);
               }
               else
               {
                  data.layoutRasterizer.changeElementAlpha("bus",255);
                  data.layoutRasterizer.changeElementAlpha("bus_oviopen_hidden",0);
               }
               var_1147 = _loc6_;
            }
            if(data.layoutRasterizer.graphicsChanged)
            {
               _loc8_ = 0;
               while(_loc8_ < data.layoutRasterizer.elementCount())
               {
                  data.layoutRasterizer.setElementToSprite(_loc8_,getSprite(_loc8_ + var_1101));
                  _loc8_++;
               }
            }
         }
      }
   }
}
