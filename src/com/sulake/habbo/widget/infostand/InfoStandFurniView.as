package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class InfoStandFurniView
   {
       
      
      private var var_60:IItemListWindow;
      
      private var _widget:InfostandWidget;
      
      private var var_216:IBorderWindow;
      
      private var _window:IItemListWindow;
      
      private var var_102:IItemListWindow;
      
      public function InfoStandFurniView(param1:InfostandWidget, param2:String)
      {
         super();
         _widget = param1;
         createWindow(param2);
      }
      
      private function updateWindow() : void
      {
         if(var_102 == null || var_216 == null || var_60 == null)
         {
            return;
         }
         var_60.width = var_60.scrollableRegion.width;
         var_102.height = var_102.scrollableRegion.height;
         var_216.height = NaN;
         _window.width = Math.max(var_216.width,var_60.width);
         _window.height = _window.scrollableRegion.height;
         if(false)
         {
            var_216.x = 0 - 0;
            var_60.x = 0;
         }
         else
         {
            var_60.x = 0 - 0;
            var_216.x = 0;
         }
         _widget.refreshContainer();
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = var_102.getListItemByName("image") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,param1.height,true,0);
         var _loc4_:Point = new Point((_loc2_.width - param1.width) / 2,0);
         _loc3_.copyPixels(param1,param1.rect,_loc4_);
         _loc2_.height = param1.height;
         _loc2_.bitmap = _loc3_;
         _loc2_.invalidate();
         updateWindow();
      }
      
      private function showButton(param1:String, param2:Boolean) : void
      {
         if(var_60 == null)
         {
            return;
         }
         var _loc3_:IWindow = var_60.getListItemByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            var_60.arrangeListItems();
         }
      }
      
      public function update(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         name = param1.name;
         description = param1.description;
         image = param1.image;
         expiration = param1.expiration;
         var _loc2_:Boolean = false;
         var _loc3_:* = false;
         var _loc4_:Boolean = false;
         if(param1.isRoomController)
         {
            _loc2_ = true;
            _loc3_ = true;
         }
         if(param1.isRoomOwner || param1.isAnyRoomController)
         {
            _loc2_ = true;
            _loc3_ = true;
            _loc4_ = true;
         }
         if(_loc3_)
         {
            _loc3_ = !param1.isWallItem;
         }
         if(param1.isStickie)
         {
            _loc2_ = false;
            _loc4_ = false;
         }
         showButton("move",_loc2_);
         showButton("rotate",_loc3_);
         showButton("pickup",_loc4_);
         var_60.visible = _loc2_ || _loc3_ || _loc4_;
         updateWindow();
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:XmlAsset = _widget.assets.getAssetByName("furni_view") as XmlAsset;
         _window = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc2_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_216 = _window.getListItemByName("info_border") as IBorderWindow;
         var_60 = _window.getListItemByName("button_list") as IItemListWindow;
         if(var_216 != null)
         {
            var_102 = var_216.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         _widget.mainContainer.addChild(_window);
         var _loc3_:IWindow = var_216.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClose);
         }
         if(var_60 != null)
         {
            _loc5_ = 0;
            while(_loc5_ < var_60.numListItems)
            {
               _loc4_ = var_60.getListItemAt(_loc5_);
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
               _loc5_++;
            }
         }
      }
      
      private function set expiration(param1:int) : void
      {
         var _loc2_:ITextWindow = var_102.getListItemByName("expiration_text") as ITextWindow;
         var _loc3_:IWindowContainer = var_102.getListItemByName("expiration_spacer") as IWindowContainer;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         _widget.localizations.registerParameter("infostand.rent.expiration","minutes",param1.toString());
         if(param1 <= 0)
         {
            _loc2_.height = 0;
            _loc3_.height = 0;
         }
         else
         {
            _loc2_.height = _loc2_.textHeight + 5;
            _loc3_.height = 1;
         }
         updateWindow();
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:IWindow = param1.target as IWindow;
         switch(_loc4_.name)
         {
            case "rotate":
               _loc3_ = "null";
               break;
            case "move":
               _loc3_ = "null";
               break;
            case "pickup":
               _loc3_ = "null";
               _widget.close();
         }
         if(_loc3_ != null)
         {
            _loc5_ = _widget.furniData.id;
            _loc6_ = _widget.furniData.category;
            _loc2_ = new RoomWidgetFurniActionMessage(_loc3_,_loc5_,_loc6_);
            _widget.messageListener.processWidgetMessage(_loc2_);
         }
      }
      
      public function get window() : IItemListWindow
      {
         return _window;
      }
      
      public function set description(param1:String) : void
      {
         var _loc2_:ITextWindow = var_102.getListItemByName("description_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + 5;
         updateWindow();
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         _widget.close();
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:ITextWindow = var_102.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      public function dispose() : void
      {
         _widget = null;
         _window.dispose();
         _window = null;
      }
   }
}
