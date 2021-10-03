package com.sulake.habbo.widget.furniture.stickie
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetStickieDataUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetStickieSendUpdateMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class StickieFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1054:Number = 100;
      
      private static const const_1052:int = 500;
      
      private static const const_1051:Number = 100;
      
      private static const const_1053:int = 14;
       
      
      private var var_189:String;
      
      private var _window:IWindowContainer;
      
      private var var_151:int = -1;
      
      private var var_647:String;
      
      private var var_1425:String;
      
      private var var_13:Boolean;
      
      public function StickieFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null)
      {
         super(param1,param2);
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetStickieDataUpdateEvent.const_591,onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      private function sendSetColor(param1:uint) : void
      {
         var _loc3_:* = null;
         if(var_151 == -1)
         {
            return;
         }
         storeTextFromField();
         var _loc2_:String = param1.toString(16).toUpperCase();
         if(_loc2_.length > 6)
         {
            _loc2_ = _loc2_.slice(_loc2_.length - 6,_loc2_.length);
         }
         if(_loc2_ == var_647)
         {
            return;
         }
         var_647 = _loc2_;
         if(messageListener != null)
         {
            _loc3_ = new RoomWidgetStickieSendUpdateMessage(RoomWidgetStickieSendUpdateMessage.const_468,var_151,var_189,var_647);
            messageListener.processWidgetMessage(_loc3_);
         }
         showInterface();
      }
      
      private function sendDelete() : void
      {
         var _loc1_:* = null;
         if(var_151 == -1)
         {
            return;
         }
         if(messageListener != null && var_13)
         {
            _loc1_ = new RoomWidgetStickieSendUpdateMessage(RoomWidgetStickieSendUpdateMessage.const_727,var_151);
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function hideInterface(param1:Boolean = true) : void
      {
         if(param1)
         {
            sendUpdate();
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         var_151 = -1;
         var_189 = null;
         var_13 = false;
      }
      
      private function setColorButtons(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:Array = new Array("blue","purple","green","yellow");
         var _loc4_:int = 0;
         while(_loc4_ <= _loc3_.length)
         {
            _loc2_ = _window.findChildByName(_loc3_[_loc4_]);
            if(_loc2_ != null)
            {
               if(param1)
               {
                  _loc2_.visible = true;
                  _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
            _loc4_++;
         }
      }
      
      private function storeTextFromField() : Boolean
      {
         var _loc1_:ITextFieldWindow = _window.findChildByName("text") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return false;
         }
         if(var_189 == _loc1_.text)
         {
            return false;
         }
         var_189 = _loc1_.text;
         return true;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetStickieDataUpdateEvent.const_591,onObjectUpdate);
      }
      
      override public function dispose() : void
      {
         hideInterface();
         super.dispose();
      }
      
      private function onObjectUpdate(param1:RoomWidgetStickieDataUpdateEvent) : void
      {
         hideInterface();
         var_151 = param1.objectId;
         var_1425 = param1.objectType;
         var_189 = param1.text;
         var_647 = param1.colorHex;
         var_13 = param1.controller;
         showInterface();
      }
      
      private function sendUpdate() : void
      {
         var _loc1_:* = null;
         if(var_151 == -1)
         {
            return;
         }
         if(!storeTextFromField())
         {
            return;
         }
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetStickieSendUpdateMessage(RoomWidgetStickieSendUpdateMessage.const_468,var_151,var_189,var_647);
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "blue":
            case "purple":
            case "green":
            case "yellow":
               sendSetColor(_loc2_.color);
               break;
            case "close":
               hideInterface();
               break;
            case "delete":
               sendDelete();
               hideInterface(false);
         }
      }
      
      private function showInterface() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_151 == -1)
         {
            return;
         }
         var _loc1_:IAsset = assets.getAssetByName("stickie");
         var _loc2_:XmlAsset = XmlAsset(_loc1_);
         if(_loc2_ == null)
         {
            return;
         }
         if(_window == null)
         {
            _window = windowManager.createWindow("stickieui_container","",HabboWindowType.const_58,HabboWindowStyle.const_38,0 | 0,new Rectangle(const_1051,const_1054,2,2),null,0) as IWindowContainer;
            _window.buildFromXML(XML(_loc2_.content));
         }
         _loc3_ = _window.findChildByName("text") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.text = var_189;
            _loc3_.addEventListener(WindowEvent.const_135,onTextWindowEvent);
         }
         _loc6_ = _window.findChildByTag("bg") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            if(var_1425 == "post_it_vd")
            {
               _loc4_ = assets.getAssetByName("stickie_vd") as BitmapDataAsset;
            }
            else
            {
               _loc4_ = assets.getAssetByName("stickie_blanco") as BitmapDataAsset;
               _loc6_.color = uint("0xFF" + var_647);
            }
            _loc5_ = _loc4_.content as BitmapData;
            _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            _loc6_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
         }
         _loc6_ = _window.findChildByTag("close_button") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc4_ = assets.getAssetByName("stickie_close") as BitmapDataAsset;
            _loc5_ = _loc4_.content as BitmapData;
            _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            _loc6_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
         }
         _loc6_ = _window.findChildByTag("delete_button") as IBitmapWrapperWindow;
         if(_loc6_ != null && var_13)
         {
            _loc4_ = assets.getAssetByName("stickie_remove") as BitmapDataAsset;
            _loc5_ = _loc4_.content as BitmapData;
            _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            _loc6_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
         }
         setColorButtons(var_13 && var_1425 == "post_it");
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         _loc2_ = _window.findChildByName("text") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.maxChars = const_1052;
         if(_loc2_.numLines < const_1053)
         {
            return;
         }
         _loc2_.text = _loc2_.text.slice(0,_loc2_.text.length - 1);
         _loc2_.maxChars = _loc2_.length;
      }
   }
}
