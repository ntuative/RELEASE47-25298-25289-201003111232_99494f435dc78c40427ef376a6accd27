package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class ClubGiftNotification
   {
       
      
      private var _catalog:IHabboCatalog;
      
      private var _window:IFrameWindow;
      
      public function ClubGiftNotification(param1:int, param2:IAssetLibrary, param3:IHabboWindowManager, param4:IHabboCatalog)
      {
         super();
         if(!param2 || !param3 || !param4)
         {
            return;
         }
         _catalog = param4;
         var _loc5_:XmlAsset = param2.getAssetByName("club_gift_notification_xml") as XmlAsset;
         if(_loc5_ == null)
         {
            return;
         }
         _window = param3.buildFromXML(_loc5_.content as XML) as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         _window.procedure = eventHandler;
         _window.center();
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "open_catalog_button":
               if(_catalog)
               {
                  _catalog.openCatalogPage(CatalogPageName.const_1228,true);
               }
               dispose();
               break;
            case "header_button_close":
            case "cancel_button":
               dispose();
               return;
         }
      }
      
      public function get visible() : Boolean
      {
         return _window && false;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _catalog = null;
      }
      
      private function setImage(param1:String, param2:BitmapData) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         var _loc5_:int = _loc4_.width * 0.5 - param2.width;
         var _loc6_:int = _loc4_.height * 0.5 - param2.height;
         _loc4_.draw(param2,new Matrix(2,0,0,2,_loc5_,_loc6_));
         _loc3_.bitmap = _loc4_;
      }
   }
}
