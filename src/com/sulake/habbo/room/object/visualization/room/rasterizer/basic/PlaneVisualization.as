package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.PlaneVisualizationAnimationLayer;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PlaneVisualization
   {
       
      
      private var var_104:Array;
      
      private var var_1190:Boolean = false;
      
      private var var_2302:Number;
      
      private var _geometry:RoomGeometry = null;
      
      private var var_1821:Boolean = false;
      
      private var var_561:Vector3d = null;
      
      private var var_25:BitmapData;
      
      private var var_2301:Number;
      
      public function PlaneVisualization(param1:Number, param2:int, param3:Number, param4:Number)
      {
         var_104 = [];
         super();
         if(param2 < 0)
         {
            param2 = 0;
         }
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            var_104.push(null);
            _loc5_++;
         }
         param3 = Number(Math.abs(param3));
         if(param3 > 90)
         {
            param3 = 90;
         }
         param4 = Number(Math.abs(param4));
         if(param4 > 90)
         {
            param4 = 90;
         }
         var_2302 = param3;
         var_2301 = param4;
         _geometry = new RoomGeometry(param1,new Vector3d(param3,param4),new Vector3d(-10,0,0));
         var_561 = new Vector3d();
      }
      
      public function render(param1:BitmapData, param2:int, param3:int, param4:IVector3d, param5:Boolean, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:Number = 0, param11:Number = 0, param12:int = 0) : BitmapData
      {
         var _loc14_:* = null;
         var _loc15_:* = null;
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(param3 < 1)
         {
            param3 = 1;
         }
         if(param1 == null || param1.width != param2 || param1.height != param3)
         {
            param1 = null;
         }
         if(var_25 != null)
         {
            if(var_25.width == param2 && var_25.height == param3 && Vector3d.isEqual(var_561,param4))
            {
               if(!hasAnimationLayers)
               {
                  if(param1 != null)
                  {
                     param1.copyPixels(var_25,var_25.rect,new Point(0,0),null,null,false);
                     return param1;
                  }
                  return var_25;
               }
            }
            else
            {
               var_25.dispose();
               var_25 = null;
            }
         }
         var_1190 = true;
         if(var_25 == null)
         {
            var_25 = new BitmapData(param2,param3,true,16777215);
         }
         else
         {
            var_25.fillRect(var_25.rect,16777215);
         }
         if(param1 == null)
         {
            param1 = var_25;
         }
         var_561.assign(param4);
         var _loc13_:int = 0;
         while(_loc13_ < var_104.length)
         {
            _loc14_ = var_104[_loc13_] as PlaneVisualizationLayer;
            _loc15_ = var_104[_loc13_] as PlaneVisualizationAnimationLayer;
            if(_loc14_ != null)
            {
               _loc14_.render(param1,param2,param3,param4,param5);
            }
            else if(_loc15_ != null)
            {
               _loc15_.render(param1,param2,param3,param4,param6,param7,param8,param9,param10,param11,param12);
            }
            _loc13_++;
         }
         if(param1 != null && param1 != var_25)
         {
            var_25.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
            return param1;
         }
         return var_25;
      }
      
      public function setAnimationLayer(param1:int, param2:XML, param3:IGraphicAssetCollection) : Boolean
      {
         if(param1 < 0 || param1 > var_104.length)
         {
            return false;
         }
         var _loc4_:* = var_104[param1] as IDisposable;
         if(_loc4_ != null)
         {
            _loc4_.dispose();
            _loc4_ = null;
         }
         _loc4_ = new PlaneVisualizationAnimationLayer(param2,param3);
         var_104[param1] = _loc4_;
         var_1821 = true;
         return true;
      }
      
      public function get hasAnimationLayers() : Boolean
      {
         return var_1821;
      }
      
      public function setLayer(param1:int, param2:PlaneMaterial, param3:uint, param4:int, param5:int = 0) : Boolean
      {
         if(param1 < 0 || param1 > var_104.length)
         {
            return false;
         }
         var _loc6_:* = var_104[param1] as IDisposable;
         if(_loc6_ != null)
         {
            _loc6_.dispose();
            _loc6_ = null;
         }
         _loc6_ = new PlaneVisualizationLayer(param2,param3,param4,param5);
         var_104[param1] = _loc6_;
         return true;
      }
      
      public function clearCache() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!var_1190)
         {
            return;
         }
         if(var_25 != null)
         {
            var_25.dispose();
            var_25 = null;
         }
         if(var_561 != null)
         {
            var_561.assign(new Vector3d());
         }
         if(var_104 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_104.length)
            {
               _loc2_ = var_104[_loc1_] as PlaneVisualizationLayer;
               _loc3_ = var_104[_loc1_] as PlaneVisualizationAnimationLayer;
               if(_loc2_ != null)
               {
                  _loc2_.clearCache();
               }
               else if(_loc3_ != null)
               {
                  _loc3_.clearCache();
               }
               _loc1_++;
            }
         }
         var_1190 = false;
      }
      
      public function get geometry() : IRoomGeometry
      {
         return _geometry;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_104 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_104.length)
            {
               _loc2_ = var_104[_loc1_] as IDisposable;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_104 = null;
         }
         if(_geometry != null)
         {
            _geometry.dispose();
            _geometry = null;
         }
         if(var_25 != null)
         {
            var_25.dispose();
         }
         if(var_561 != null)
         {
            var_561 = null;
         }
      }
   }
}
