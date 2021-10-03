package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.avatar.AvatarEditorView;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class CategoryBaseView
   {
       
      
      protected var var_38:String = "";
      
      protected var _assetLibrary:IAssetLibrary;
      
      protected var var_32:Dictionary;
      
      protected var _window:IWindowContainer;
      
      protected var var_286:String;
      
      protected var _windowManager:IHabboWindowManager;
      
      public function CategoryBaseView(param1:IHabboWindowManager, param2:IAssetLibrary)
      {
         super();
         _assetLibrary = param2;
         _windowManager = param1;
         var_32 = new Dictionary();
      }
      
      protected function setElementImage(param1:IBitmapWrapperWindow, param2:Boolean) : void
      {
         var asset:IAsset = null;
         var assetName:String = null;
         var src:BitmapData = null;
         var dx:int = 0;
         var dy:int = 0;
         var bmpWindow:IBitmapWrapperWindow = param1;
         var active:Boolean = param2;
         if(!_assetLibrary)
         {
            return;
         }
         if(bmpWindow == null)
         {
            return;
         }
         var result:Array = bmpWindow.properties.filter(function(param1:*, param2:int, param3:Array):Boolean
         {
            return PropertyStruct(param1).key == "bitmap_asset_name";
         });
         if(result && result.length)
         {
            assetName = PropertyStruct(result[0]).value as String;
            if(active)
            {
               assetName = assetName.replace("_on","");
            }
            asset = _assetLibrary.getAssetByName(assetName);
            if(asset && asset is BitmapDataAsset)
            {
               bmpWindow.bitmap = new BitmapData(bmpWindow.width,bmpWindow.height,false,AvatarEditorView.var_2257);
               src = BitmapDataAsset(asset).content as BitmapData;
               dx = (bmpWindow.width - src.width) / 2;
               dy = (bmpWindow.height - src.height) / 2;
               bmpWindow.bitmap.copyPixels(src,src.rect,new Point(dx,dy));
            }
         }
      }
      
      public function showColorLayerTabAmount(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         if(var_32)
         {
            _loc3_ = var_32[param1] as AvatarEditorGridView;
            if(_loc3_)
            {
               _loc3_.showColorLayerTabs(param2);
            }
         }
      }
      
      protected function inactivateTab(param1:String) : void
      {
         if(!_window)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         setElementImage(_loc2_,false);
      }
      
      protected function changeToCurrentTab() : void
      {
         var _loc1_:IWindowContainer = _window.findChildByName("grid_container") as IWindowContainer;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.removeChildAt(0);
         var _loc2_:AvatarEditorGridView = var_32[var_286];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.window;
         if(_loc3_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.addChild(_loc3_);
         _loc1_.invalidate();
         if(_loc2_.firstView)
         {
            _loc2_.initFromList();
         }
      }
      
      protected function activateTab(param1:String) : void
      {
         if(!_window)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         setElementImage(_loc2_,true);
      }
      
      public function selectColorLayerTab(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         if(var_32)
         {
            _loc3_ = var_32[param1] as AvatarEditorGridView;
            if(_loc3_)
            {
               _loc3_.selectColorLayerTab(param2);
            }
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
      
      protected function attachImages() : void
      {
         var _loc2_:* = null;
         if(!_window)
         {
            return;
         }
         var _loc1_:Array = new Array();
         _window.groupChildrenWithTag("bitmap",_loc1_,true);
         for each(_loc2_ in _loc1_)
         {
            setElementImage(_loc2_,false);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_32)
         {
            for each(_loc1_ in var_32)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_32 = null;
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         _assetLibrary = null;
         _windowManager = null;
      }
   }
}
