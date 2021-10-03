package com.sulake.habbo.session
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   
   public class BadgeImageManager
   {
      
      public static const const_1213:String = "normal_badge";
      
      public static var loading_icon_png:Class = BadgeImageManager_loading_icon_png;
      
      public static const const_1010:String = "group_badge";
       
      
      private const const_1405:String = "badge_";
      
      private var _localization:IHabboLocalizationManager;
      
      private var _assets:IAssetLibrary;
      
      private var var_155:IHabboConfigurationManager;
      
      private var _events:IEventDispatcher;
      
      public function BadgeImageManager(param1:IAssetLibrary, param2:IEventDispatcher, param3:IHabboConfigurationManager, param4:IHabboLocalizationManager)
      {
         super();
         if(param1 == null)
         {
            param1 = new AssetLibrary("badge_images");
         }
         _assets = param1;
         _events = param2;
         var_155 = param3;
         _localization = param4;
      }
      
      private function onBadgeImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            if(_loc2_.assetLoader != null && _loc2_.assetLoader.content != null)
            {
               _loc3_ = _loc2_.assetLoader.content as Bitmap;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc4_ = _loc2_.assetName.replace(const_1405,"");
               _events.dispatchEvent(new BadgeImageReadyEvent(_loc4_,_loc3_.bitmapData.clone()));
            }
         }
      }
      
      public function getBadgeImage(param1:String, param2:String = "normal_badge") : BitmapData
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc3_:String = const_1405 + param1;
         if(_assets.hasAsset(_loc3_))
         {
            _loc7_ = _assets.getAssetByName(_loc3_) as BitmapDataAsset;
            return (_loc7_.content as BitmapData).clone();
         }
         switch(param2)
         {
            case const_1213:
               if(var_155 != null)
               {
                  _loc5_ = var_155.getKey("image.library.url","http://images.habbo.com/c_images/");
                  _loc5_ += "album1584/" + param1 + ".gif";
                  _loc4_ = new URLRequest(_loc5_);
               }
               break;
            case const_1010:
               if(var_155 != null)
               {
                  if(var_155 != null)
                  {
                     _loc5_ = var_155.getKey("group.badge.url");
                     _loc5_ = _loc5_.replace("%imagerdata%",param1);
                     _loc4_ = new URLRequest(_loc5_);
                  }
               }
         }
         if(_loc4_ != null)
         {
            _loc8_ = _assets.loadAssetFromFile(_loc3_,_loc4_,"image/gif");
            _loc8_.addEventListener(AssetLoaderEvent.const_33,onBadgeImageReady);
         }
         var _loc6_:Bitmap = Bitmap(new loading_icon_png());
         return _loc6_.bitmapData.clone();
      }
      
      public function dispose() : void
      {
         _assets = null;
      }
   }
}
