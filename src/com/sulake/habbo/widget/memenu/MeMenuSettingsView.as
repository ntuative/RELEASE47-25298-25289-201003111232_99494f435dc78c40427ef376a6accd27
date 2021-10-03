package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStoreSettingsMessage;
   import flash.display.BitmapData;
   
   public class MeMenuSettingsView implements IMeMenuView
   {
       
      
      private var var_1567:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var _widget:MeMenuWidget;
      
      private var var_730:MeMenuSettingsViewSlider;
      
      private var var_1569:BitmapData;
      
      private var var_1566:BitmapData;
      
      private var var_729:Number = 1;
      
      private var var_1568:BitmapData;
      
      public function MeMenuSettingsView()
      {
         super();
      }
      
      public function init(param1:MeMenuWidget, param2:String) : void
      {
         _widget = param1;
         createWindow(param2);
      }
      
      public function saveVolume(param1:Number, param2:Boolean = true) : void
      {
         var _loc3_:* = null;
         if(param2)
         {
            _loc3_ = new RoomWidgetStoreSettingsMessage(RoomWidgetStoreSettingsMessage.const_579);
         }
         else
         {
            _loc3_ = new RoomWidgetStoreSettingsMessage(RoomWidgetStoreSettingsMessage.const_638);
         }
         _loc3_.volume = param1;
         _widget.messageListener.processWidgetMessage(_loc3_);
      }
      
      public function updateSettings(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         var_729 = param1.volume;
         if(var_730 != null)
         {
            var_730.setValue(var_729);
         }
         setSoundsOffIcon();
         setSoundsOnIcon();
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:XmlAsset = _widget.assets.getAssetByName("memenu_settings") as XmlAsset;
         _window = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         _window.name = param1;
         var _loc4_:int = 0;
         while(_loc4_ < _window.numChildren)
         {
            _loc3_ = _window.getChildAt(_loc4_);
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
            _loc4_++;
         }
         _loc5_ = _widget.assets.getAssetByName("sounds_off_color") as BitmapDataAsset;
         if(_loc5_ != null && _loc5_.content != null)
         {
            var_1568 = (_loc5_.content as BitmapData).clone();
         }
         _loc5_ = _widget.assets.getAssetByName("sounds_off_white") as BitmapDataAsset;
         if(_loc5_ != null && _loc5_.content != null)
         {
            var_1567 = (_loc5_.content as BitmapData).clone();
         }
         _loc5_ = _widget.assets.getAssetByName("sounds_on_color") as BitmapDataAsset;
         if(_loc5_ != null && _loc5_.content != null)
         {
            var_1569 = (_loc5_.content as BitmapData).clone();
         }
         _loc5_ = _widget.assets.getAssetByName("sounds_on_white") as BitmapDataAsset;
         if(_loc5_ != null && _loc5_.content != null)
         {
            var_1566 = (_loc5_.content as BitmapData).clone();
         }
         var_730 = new MeMenuSettingsViewSlider(this,_window.findChildByName("volume_container") as IWindowContainer,_widget.assets,0,1);
         setSoundsOffIcon();
         setSoundsOnIcon();
         _loc6_ = _window.findChildByName("sounds_off");
         if(_loc6_ != null)
         {
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onButtonOver);
            _loc6_.addEventListener(WindowMouseEvent.const_29,onButtonOut);
         }
         _loc6_ = _window.findChildByName("sounds_on");
         if(_loc6_ != null)
         {
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onButtonOver);
            _loc6_.addEventListener(WindowMouseEvent.const_29,onButtonOut);
         }
         _widget.mainContainer.addChild(_window);
         _widget.messageListener.processWidgetMessage(new RoomWidgetGetSettingsMessage(RoomWidgetGetSettingsMessage.const_502));
      }
      
      private function setBitmapWrapperContent(param1:String, param2:BitmapData) : void
      {
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ != null && param2 != null)
         {
            _loc3_.bitmap = param2.clone();
         }
      }
      
      public function get volume() : Number
      {
         return volume;
      }
      
      private function onButtonOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "sounds_off":
               if(var_729 != 0)
               {
                  setBitmapWrapperContent("sounds_off_icon",var_1567);
               }
               break;
            case "sounds_on":
               if(var_729 != 1)
               {
                  setBitmapWrapperContent("sounds_on_icon",var_1566);
               }
         }
      }
      
      public function dispose() : void
      {
         saveVolume(var_729);
         _widget = null;
         if(_window != null)
         {
            _window.dispose();
         }
         _window = null;
         if(var_730 != null)
         {
            var_730.dispose();
         }
         var_730 = null;
      }
      
      private function setSoundsOffIcon(param1:BitmapData = null) : void
      {
         if(param1 != null)
         {
            setBitmapWrapperContent("sounds_off_icon",param1);
         }
         else if(var_729 == 0)
         {
            setBitmapWrapperContent("sounds_off_icon",var_1568);
         }
         else
         {
            setBitmapWrapperContent("sounds_off_icon",var_1567);
         }
      }
      
      private function setSoundsOnIcon(param1:BitmapData = null) : void
      {
         if(param1 != null)
         {
            setBitmapWrapperContent("sounds_on_icon",param1);
         }
         else if(var_729 == 1)
         {
            setBitmapWrapperContent("sounds_on_icon",var_1569);
         }
         else
         {
            setBitmapWrapperContent("sounds_on_icon",var_1566);
         }
      }
      
      private function onButtonOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "sounds_off_icon":
            case "sounds_off":
               setBitmapWrapperContent("sounds_off_icon",var_1568);
               break;
            case "sounds_on_icon":
            case "sounds_on":
               setBitmapWrapperContent("sounds_on_icon",var_1569);
         }
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc3_:IWindow = param1.target as IWindow;
         var _loc4_:String = _loc3_.name;
         switch(_loc4_)
         {
            case "sounds_off":
               saveVolume(0,false);
               break;
            case "sounds_on":
               saveVolume(1,false);
               break;
            case "back_btn":
               _widget.changeView(MeMenuWidget.const_111);
               break;
            default:
               Logger.log("Me Menu Settings View: unknown button: " + _loc4_);
         }
      }
   }
}
