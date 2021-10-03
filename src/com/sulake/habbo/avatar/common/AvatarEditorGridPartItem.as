package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarEditorGridPartItem
   {
      
      private static var var_63:Array = [];
      
      {
         var_63.push("li");
         var_63.push("lh");
         var_63.push("ls");
         var_63.push("lc");
         var_63.push("bd");
         var_63.push("sh");
         var_63.push("lg");
         var_63.push("ch");
         var_63.push("ca");
         var_63.push("cc");
         var_63.push("wa");
         var_63.push("rh");
         var_63.push("rs");
         var_63.push("rc");
         var_63.push("hd");
         var_63.push("fc");
         var_63.push("ey");
         var_63.push("hr");
         var_63.push("hrb");
         var_63.push("fa");
         var_63.push("ea");
         var_63.push("ha");
         var_63.push("he");
         var_63.push("ri");
      }
      
      private const const_1605:int = 16777215;
      
      private var _isSelected:Boolean = false;
      
      private var var_1048:BitmapData;
      
      private const const_1604:int = 13421772;
      
      private var var_852:Rectangle;
      
      private var _colors:Array;
      
      private var _window:IWindowContainer;
      
      private var var_1516:Boolean;
      
      private var var_366:BitmapData;
      
      private var _model:IAvatarEditorCategoryModel;
      
      private var var_576:IFigurePartSet;
      
      private var var_1517:int = 0;
      
      public function AvatarEditorGridPartItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IFigurePartSet, param4:Array, param5:Boolean = true)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         super();
         _model = param2;
         var_576 = param3;
         _window = param1;
         _colors = param4;
         var_1516 = param5;
         var _loc6_:BitmapDataAsset = param2.controller.assets.getAssetByName("habbo_club_icon") as BitmapDataAsset;
         var_1048 = _loc6_.content as BitmapData;
         if(param3 == null)
         {
            var_366 = new BitmapData(1,1,true,16777215);
         }
         if(param3 != null)
         {
            _loc8_ = param3.parts;
            for each(_loc7_ in _loc8_)
            {
               var_1517 = Math.max(var_1517,_loc7_.colorLayerIndex);
            }
         }
         updateThumbVisualization();
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
         updateThumbVisualization();
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_366 = param1;
         updateThumbVisualization();
      }
      
      public function get colorLayerCount() : int
      {
         return var_1517;
      }
      
      private function sortByDrawOrder(param1:IFigurePart, param2:IFigurePart) : Number
      {
         var _loc3_:Number = var_63.indexOf(param1.type);
         var _loc4_:Number = var_63.indexOf(param2.type);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      private function updateThumbVisualization() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc1_)
         {
            if(var_366 != null && !var_1516)
            {
               _loc2_ = var_366;
            }
            else
            {
               _loc2_ = renderThumb();
               if(!_loc2_)
               {
                  return;
               }
            }
            _loc3_ = !!_loc1_.bitmap ? _loc1_.bitmap : new BitmapData(_loc1_.width,_loc1_.height);
            _loc3_.fillRect(_loc3_.rect,16777215);
            _loc4_ = (_loc3_.width - _loc2_.width) / 2;
            _loc5_ = (_loc3_.height - _loc2_.height) / 2;
            _loc3_.copyPixels(_loc2_,_loc2_.rect,new Point(_loc4_,_loc5_),null,null,true);
            _loc1_.bitmap = _loc3_;
         }
         if(var_576 != null && false)
         {
            _loc6_ = _window.findChildByTag("CLUB_ICON") as IBitmapWrapperWindow;
            if(_loc6_ != null)
            {
               _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
               _loc6_.bitmap.copyPixels(var_1048,var_1048.rect,new Point(0,0),null,null,true);
            }
         }
         if(isSelected)
         {
            _window.color = const_1604;
         }
         else
         {
            _window.color = const_1605;
         }
         _window.invalidate();
      }
      
      public function get id() : int
      {
         if(var_576 == null)
         {
            return -1;
         }
         return var_576.id;
      }
      
      public function dispose() : void
      {
         _model = null;
         var_576 = null;
         if(_window != null)
         {
            if(false)
            {
            }
         }
         _window = null;
      }
      
      public function update() : void
      {
         updateThumbVisualization();
      }
      
      public function set colors(param1:Array) : void
      {
         _colors = param1;
         updateThumbVisualization();
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      private function analyzeLayers() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(partSet == null)
         {
            return false;
         }
         var _loc5_:Rectangle = new Rectangle();
         for each(_loc1_ in partSet.parts)
         {
            _loc2_ = "undefined_undefined_" + _loc1_.type + "_" + _loc1_.id + "_" + FigureData.const_894 + "_" + FigureData.const_266;
            _loc3_ = _model.controller.avatarRenderManager.getAssetByName(_loc2_) as BitmapDataAsset;
            if(_loc3_ != null)
            {
               _loc4_ = (_loc3_.content as BitmapData).clone();
               _loc5_ = _loc5_.union(new Rectangle(-1 * _loc3_.offset.x,-1 * _loc3_.offset.y,_loc4_.width,_loc4_.height));
            }
         }
         var_852 = _loc5_;
         return true;
      }
      
      public function get partSet() : IFigurePartSet
      {
         return var_576;
      }
      
      private function renderThumb() : BitmapData
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         if(var_852 == null)
         {
            if(!analyzeLayers())
            {
               return null;
            }
         }
         _loc1_ = new BitmapData(var_852.width,var_852.height,true,16777215);
         var _loc6_:Array = partSet.parts.concat().sort(sortByDrawOrder);
         for each(_loc2_ in _loc6_)
         {
            _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + FigureData.const_894 + "_" + FigureData.const_266;
            _loc4_ = _model.controller.avatarRenderManager.getAssetByName(_loc3_) as BitmapDataAsset;
            if(_loc4_ != null)
            {
               _loc5_ = (_loc4_.content as BitmapData).clone();
               _loc7_ = -1 * _loc4_.offset.x - 0;
               _loc8_ = -1 * _loc4_.offset.y - 0;
               if(var_1516 && _loc2_.colorLayerIndex > 0)
               {
                  _loc9_ = _colors[_loc2_.colorLayerIndex - 1];
                  if(_loc9_ != null)
                  {
                     _loc5_.colorTransform(_loc5_.rect,_loc9_.colorTransform);
                  }
               }
               _loc1_.copyPixels(_loc5_,_loc5_.rect,new Point(_loc7_,_loc8_),null,null,true);
            }
            else
            {
               Logger.log("Could not find asset: " + _loc3_);
            }
         }
         return _loc1_;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
   }
}
