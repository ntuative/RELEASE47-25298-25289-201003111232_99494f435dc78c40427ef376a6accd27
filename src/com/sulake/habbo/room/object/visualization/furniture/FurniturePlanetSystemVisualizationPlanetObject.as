package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.utils.Vector3d;
   
   public class FurniturePlanetSystemVisualizationPlanetObject
   {
      
      private static const const_1080:Number = 30;
       
      
      private var _height:Number;
      
      private var var_840:Number;
      
      private var var_1501:Number;
      
      private var _index:int;
      
      private var _children:Array;
      
      private var _name:String;
      
      private var var_690:Vector3d;
      
      private var var_1275:Number;
      
      private var var_1996:Number;
      
      public function FurniturePlanetSystemVisualizationPlanetObject(param1:String, param2:int, param3:Number, param4:Number, param5:Number, param6:Number)
      {
         var_690 = new Vector3d(0,0,0);
         _children = new Array();
         super();
         _name = param1;
         _index = param2;
         var_1275 = param3;
         var_1996 = param4 * 0 * 2 / 360;
         var_1501 = param5 * 0 * 2 / 360;
         _height = param6;
         var_840 = 0;
      }
      
      public function getPositionVector(param1:Vector3d, param2:Number) : Vector3d
      {
         var _loc3_:Number = var_1275 * Math.cos(var_840 + var_1501);
         var _loc4_:Number = var_1275 * Math.sin(var_840 + var_1501);
         var _loc5_:Number = _height;
         var_690.x = (_loc3_ - _loc4_) * (param2 / 2);
         var_690.y = (_loc4_ + _loc3_) * (param2 / 2) * 0.5 - _height * (param2 / 2);
         var_690.z = -int(4 * (_loc3_ + _loc4_) - 0.7);
         if(param1 != null)
         {
            var_690.add(param1);
         }
         return var_690;
      }
      
      public function update(param1:Array, param2:Vector3d, param3:Number) : void
      {
         var _loc4_:* = null;
         var_840 += var_1996 / const_1080;
         param1[_index] = getPositionVector(param2,param3);
         var _loc5_:int = 0;
         while(_loc5_ < _children.length)
         {
            _loc4_ = _children[_loc5_];
            _loc4_.update(param1,var_690,param3);
            _loc5_++;
         }
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = _children.shift();
            if(_loc1_ != null)
            {
               _loc1_.dispose();
            }
         }
      }
      
      public function hasChild(param1:String) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < _children.length)
         {
            _loc2_ = _children[_loc3_];
            if(_loc2_.name == param1)
            {
               return true;
            }
            if(_loc2_.hasChild(param1))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function getChild(param1:String) : FurniturePlanetSystemVisualizationPlanetObject
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < _children.length)
         {
            _loc2_ = _children[_loc3_];
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
            if(_loc2_.hasChild(param1))
            {
               return _loc2_.getChild(param1);
            }
            _loc3_++;
         }
         return null;
      }
      
      public function addChild(param1:FurniturePlanetSystemVisualizationPlanetObject) : void
      {
         if(_children.indexOf(param1) < 0)
         {
            _children.push(param1);
         }
      }
   }
}
