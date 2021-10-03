package com.sulake.room.object.visualization
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomObjectSpriteVisualization implements IRoomObjectSpriteVisualization
   {
      
      private static var var_1182:int = 0;
       
      
      private var var_259:IRoomObject;
      
      protected var var_208:int = -1;
      
      private var _updateID:int = 0;
      
      private var var_175:Array;
      
      protected var var_288:int = -1;
      
      protected var var_161:int = -1;
      
      private var _instanceId:int = 0;
      
      private var var_879:IGraphicAssetCollection;
      
      public function RoomObjectSpriteVisualization()
      {
         super();
         _instanceId = var_1182++;
         var_175 = [];
         var_259 = null;
         var_879 = null;
      }
      
      protected function increaseUpdateId() : void
      {
         ++_updateID;
      }
      
      public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
      }
      
      public function get spriteCount() : int
      {
         return var_175.length;
      }
      
      public function getInstanceId() : int
      {
         return _instanceId;
      }
      
      protected function reset() : void
      {
         var_288 = 4294967295;
         var_161 = 4294967295;
         var_208 = -1;
      }
      
      public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         return false;
      }
      
      public function get image() : BitmapData
      {
         return getImage(0);
      }
      
      public function set assetCollection(param1:IGraphicAssetCollection) : void
      {
         var_879 = param1;
      }
      
      public function getUpdateID() : int
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_175 != null)
         {
            while(false)
            {
               _loc1_ = var_175[0] as RoomObjectSprite;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               var_175.pop();
            }
            var_175 = null;
         }
         var_259 = null;
         var_879 = null;
      }
      
      public function getImage(param1:int) : BitmapData
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc2_:Rectangle = boundingRectangle;
         if(_loc2_.width * _loc2_.height == 0)
         {
            return null;
         }
         var _loc3_:int = spriteCount;
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:int = 0;
         var _loc7_:* = null;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = getSprite(_loc6_);
            if(_loc4_ != null && _loc4_.visible)
            {
               _loc7_ = _loc4_.asset;
               if(_loc7_ != null)
               {
                  _loc5_.push(_loc4_);
               }
            }
            _loc6_++;
         }
         _loc5_.sortOn("relativeDepth",0 | 0);
         var _loc8_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,param1);
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc4_ = _loc5_[_loc6_] as IRoomObjectSprite;
            _loc7_ = _loc4_.asset;
            if(_loc7_ != null)
            {
               _loc12_ = _loc4_.color;
               _loc13_ = _loc12_ >> 16;
               _loc14_ = _loc12_ >> 8 & 255;
               _loc15_ = _loc12_ & 255;
               _loc16_ = null;
               if(_loc13_ < 255 || _loc14_ < 255 || _loc15_ < 255)
               {
                  _loc9_ = _loc13_ / 255;
                  _loc10_ = _loc14_ / 255;
                  _loc11_ = _loc15_ / 255;
                  _loc16_ = new ColorTransform(_loc9_,_loc10_,_loc11_,_loc4_.alpha / 255);
               }
               else if(_loc4_.alpha < 255)
               {
                  _loc16_ = new ColorTransform(1,1,1,_loc4_.alpha / 255);
               }
               if(param1 == 0)
               {
                  if(_loc4_.blendMode == BlendMode.ADD)
                  {
                     if(_loc16_ == null)
                     {
                        _loc16_ = new ColorTransform(1,1,1,0);
                     }
                     else
                     {
                        _loc16_.alphaMultiplier = 0;
                     }
                  }
               }
               _loc17_ = new Matrix();
               if(_loc4_.flipH)
               {
                  _loc17_.scale(-1,1);
                  _loc17_.translate(_loc7_.width,0);
               }
               _loc17_.translate(_loc4_.offsetX - _loc2_.left,_loc4_.offsetY - _loc2_.top);
               _loc8_.draw(_loc7_,_loc17_,_loc16_,_loc4_.blendMode,null,false);
            }
            _loc6_++;
         }
         return _loc8_;
      }
      
      protected function createSprites(param1:int) : void
      {
         var _loc2_:* = null;
         while(var_175.length > param1)
         {
            _loc2_ = var_175["-1"] as RoomObjectSprite;
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            var_175.pop();
         }
         while(var_175.length < param1)
         {
            _loc2_ = new RoomObjectSprite();
            var_175.push(_loc2_);
         }
      }
      
      public function get boundingRectangle() : Rectangle
      {
         var _loc7_:* = null;
         var _loc1_:int = spriteCount;
         var _loc2_:* = null;
         var _loc3_:Rectangle = new Rectangle();
         var _loc4_:int = 0;
         var _loc6_:* = null;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = getSprite(_loc4_);
            if(_loc2_ != null && _loc2_.visible)
            {
               _loc6_ = _loc2_.asset;
               if(_loc6_ != null)
               {
                  _loc7_ = new Point(_loc2_.offsetX,_loc2_.offsetY);
                  if(_loc4_ == 0)
                  {
                     _loc3_.left = _loc7_.x;
                     _loc3_.top = _loc7_.y;
                     _loc3_.right = _loc7_.x + _loc2_.width;
                     _loc3_.bottom = _loc7_.y + _loc2_.height;
                  }
                  else
                  {
                     if(_loc7_.x < _loc3_.left)
                     {
                        _loc3_.left = _loc7_.x;
                     }
                     if(_loc7_.y < _loc3_.top)
                     {
                        _loc3_.top = _loc7_.y;
                     }
                     if(_loc7_.x + _loc2_.width > _loc3_.right)
                     {
                        _loc3_.right = _loc7_.x + _loc2_.width;
                     }
                     if(_loc7_.y + _loc2_.height > _loc3_.bottom)
                     {
                        _loc3_.bottom = _loc7_.y + _loc2_.height;
                     }
                  }
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getSprite(param1:int) : IRoomObjectSprite
      {
         if(param1 >= 0 && param1 < var_175.length)
         {
            return var_175[param1];
         }
         return null;
      }
      
      public function get assetCollection() : IGraphicAssetCollection
      {
         return var_879;
      }
      
      public function set object(param1:IRoomObject) : void
      {
         var_259 = param1;
      }
      
      public function get object() : IRoomObject
      {
         return var_259;
      }
   }
}
