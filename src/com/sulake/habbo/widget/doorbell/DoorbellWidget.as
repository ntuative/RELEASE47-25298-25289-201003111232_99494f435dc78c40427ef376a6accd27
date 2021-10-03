package com.sulake.habbo.widget.doorbell
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetDoorbellEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetLetUserInMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class DoorbellWidget extends RoomWidgetBase
   {
      
      private static const const_1056:int = 50;
       
      
      private var _view:DoorbellView;
      
      private var _users:Array;
      
      public function DoorbellWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager)
      {
         super(param1,param2,param3);
         _view = new DoorbellView(this);
         _users = [];
      }
      
      private function onDoorbellRinging(param1:RoomWidgetDoorbellEvent) : void
      {
         addUser(param1.userName);
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetDoorbellEvent.const_623,onDoorbellRinging);
         param1.addEventListener(RoomWidgetDoorbellEvent.const_123,onDoorbellHandled);
         param1.addEventListener(RoomWidgetDoorbellEvent.const_54,onDoorbellHandled);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return _view.mainWindow;
      }
      
      public function addUser(param1:String) : void
      {
         if(_users.indexOf(param1) != -1)
         {
            return;
         }
         if(_users.length >= const_1056)
         {
            deny(param1);
            return;
         }
         _users.push(param1);
         _view.update();
      }
      
      public function get users() : Array
      {
         return _users;
      }
      
      public function denyAll() : void
      {
         while(false)
         {
            deny(_users[0]);
         }
      }
      
      public function removeUser(param1:String) : void
      {
         var _loc2_:int = _users.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         _users.splice(_loc2_,1);
         _view.update();
      }
      
      public function accept(param1:String) : void
      {
         var _loc2_:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(param1,true);
         messageListener.processWidgetMessage(_loc2_);
         removeUser(param1);
      }
      
      public function deny(param1:String) : void
      {
         var _loc2_:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(param1,false);
         messageListener.processWidgetMessage(_loc2_);
         removeUser(param1);
      }
      
      private function onDoorbellHandled(param1:RoomWidgetDoorbellEvent) : void
      {
         removeUser(param1.userName);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetDoorbellEvent.const_623,onDoorbellRinging);
         param1.removeEventListener(RoomWidgetDoorbellEvent.const_123,onDoorbellHandled);
         param1.removeEventListener(RoomWidgetDoorbellEvent.const_54,onDoorbellHandled);
      }
      
      override public function dispose() : void
      {
         _users = null;
         super.dispose();
      }
   }
}
