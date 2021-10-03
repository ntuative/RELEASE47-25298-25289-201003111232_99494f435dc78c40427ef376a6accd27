package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1103:int = 100;
      
      private static const const_1104:int = 200;
      
      private static const const_1105:int = 180;
      
      public static const const_839:int = 1;
      
      public static const const_352:int = 2;
      
      private static const const_1106:int = 250;
      
      private static const const_779:int = 5;
       
      
      private var var_600:BitmapData;
      
      private var var_313:Timer;
      
      private var var_8:IWindowContainer;
      
      private var var_720:BitmapData;
      
      private var var_314:Timer;
      
      private var var_73:IWindowContainer;
      
      private var var_1554:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_314 = new Timer(const_1106,1);
         var_313 = new Timer(const_1103,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_73 = param1;
         var_73.visible = false;
         _assets = param2;
         var_314.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_313.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_720 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_600 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_73.visible = false;
         var_313.reset();
         var_314.reset();
         if(var_8 != null)
         {
            var_8.removeChild(var_73);
         }
      }
      
      public function hideDelayed() : void
      {
         var_313.reset();
         var_314.reset();
         var_313.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_314 != null)
         {
            var_314.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_314.stop();
            var_314 = null;
         }
         if(var_313 != null)
         {
            var_313.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_313.stop();
            var_313 = null;
         }
         _assets = null;
         var_73 = null;
         var_8 = null;
         var_600 = null;
         var_720 = null;
      }
      
      public function showDelayed() : void
      {
         var_313.reset();
         var_314.reset();
         var_314.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_73 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_8 != null)
         {
            var_8.removeChild(var_73);
         }
         var_8 = param1;
         var_1554 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_73.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_73.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1105,param3.width),Math.min(const_1104,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_73.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_73 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_73.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_839:
               _loc2_.bitmap = var_720.clone();
               _loc2_.width = var_720.width;
               _loc2_.height = var_720.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_352:
               _loc2_.bitmap = var_600.clone();
               _loc2_.width = var_600.width;
               _loc2_.height = var_600.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_313.reset();
         var_314.reset();
         if(var_8 == null)
         {
            return;
         }
         var_73.visible = true;
         var_8.addChild(var_73);
         refreshArrow(var_1554);
         switch(var_1554)
         {
            case const_839:
               var_73.x = 0 - const_779;
               break;
            case const_352:
               var_73.x = var_8.width + const_779;
         }
         var_73.y = (0 - 0) / 2;
      }
   }
}
