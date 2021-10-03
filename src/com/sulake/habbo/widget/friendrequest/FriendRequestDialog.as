package com.sulake.habbo.widget.friendrequest
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FriendRequestDialog
   {
       
      
      private var _widget:FriendRequestWidget;
      
      private var _userId:int;
      
      private var var_1042:int;
      
      private var _window:IWindowContainer;
      
      private var var_1279:Boolean = false;
      
      private var _userName:String;
      
      private var var_1280:Boolean = false;
      
      public function FriendRequestDialog(param1:FriendRequestWidget, param2:int, param3:int, param4:String)
      {
         super();
         _widget = param1;
         var_1042 = param2;
         _userId = param3;
         _userName = param4;
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !_widget)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               var_1279 = true;
               break;
            case WindowMouseEvent.const_29:
               var_1279 = false;
               break;
            case WindowMouseEvent.const_49:
               var_1280 = true;
               break;
            case WindowMouseEvent.const_90:
            case WindowMouseEvent.const_454:
               var_1280 = false;
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               switch(param2.name)
               {
                  case "accept_button":
                     _widget.acceptRequest(var_1042);
                     break;
                  case "decline_button":
                     _widget.declineRequest(var_1042);
                     break;
                  case "close_button":
                     _widget.ignoreRequest(var_1042);
               }
         }
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      private function createWindow() : void
      {
         if(!_widget || true || true)
         {
            return;
         }
         var _loc1_:XmlAsset = _widget.assets.getAssetByName("instant_friend_request") as XmlAsset;
         if(!_loc1_)
         {
            return;
         }
         _window = _widget.windowManager.buildFromXML(_loc1_.content as XML,0) as IWindowContainer;
         if(!_window)
         {
            return;
         }
         _window.procedure = windowEventHandler;
         var _loc2_:ITextWindow = _window.findChildByName("text") as ITextWindow;
         if(_loc2_)
         {
            _loc2_.text = _widget.localizations.registerParameter("widget.friendrequest.from","username",_userName);
         }
         setImageAsset(_window.findChildByName("close_button") as IBitmapWrapperWindow,"bubble_close");
         setImageAsset(_window.findChildByName("pointer") as IBitmapWrapperWindow,"bubble_arrow");
      }
      
      public function setImageAsset(param1:IBitmapWrapperWindow, param2:String) : void
      {
         if(!param1 || !_widget || true)
         {
            return;
         }
         var _loc3_:BitmapDataAsset = _widget.assets.getAssetByName(param2) as BitmapDataAsset;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         if(!_loc4_)
         {
            return;
         }
         if(param1.bitmap)
         {
            param1.bitmap.dispose();
         }
         param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         param1.bitmap.draw(_loc4_);
      }
      
      public function set targetRect(param1:Rectangle) : void
      {
         var _loc5_:* = null;
         if(!param1)
         {
            _widget.ignoreRequest(var_1042);
            return;
         }
         if(var_1279 || var_1280)
         {
            return;
         }
         var _loc2_:Boolean = true;
         if(!_window)
         {
            createWindow();
            _loc2_ = false;
         }
         if(!_window)
         {
            return;
         }
         var _loc3_:Point = new Point(param1.left + param1.width / 2 - 0,param1.top - 0 + 10);
         var _loc4_:Number = Point.distance(_window.rectangle.topLeft,_loc3_);
         if(_loc2_ && _loc4_ > 5)
         {
            _loc5_ = Point.interpolate(_window.rectangle.topLeft,_loc3_,0.5);
            _window.x = _loc5_.x;
            _window.y = _loc5_.y;
         }
         else
         {
            _window.x = _loc3_.x;
            _window.y = _loc3_.y;
         }
      }
      
      public function dispose() : void
      {
         _widget = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
   }
}
