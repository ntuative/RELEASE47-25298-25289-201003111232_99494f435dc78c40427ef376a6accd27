package com.sulake.habbo.widget.chooser
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.events.RoomWidgetChooserContentEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class UserChooserWidget extends ChooserWidgetBase
   {
       
      
      private const const_1409:int = 1;
      
      private const const_1613:int = 0;
      
      private var _userChooser:ChooserView;
      
      public function UserChooserWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null, param3:IHabboLocalizationManager = null)
      {
         super(param1,param2,param3);
      }
      
      private function onChooserContent(param1:RoomWidgetChooserContentEvent) : void
      {
         if(param1 == null || param1.items == null)
         {
            return;
         }
         if(_userChooser == null)
         {
            _userChooser = new ChooserView(this,"${widget.chooser.user.title}");
         }
         _userChooser.populate(param1.items,false);
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChooserContentEvent.const_505,onChooserContent);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_244,onUpdateUserChooser);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_637,onUpdateUserChooser);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdateUserChooser(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(_userChooser == null || !_userChooser.isOpen())
         {
            return;
         }
         var _loc2_:RoomWidgetRequestWidgetMessage = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.REQUEST_USER_CHOOSER);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      override public function initialize(param1:int) : void
      {
         var _loc2_:* = null;
         super.initialize(param1);
         if(param1 == const_1409)
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.REQUEST_USER_CHOOSER);
            messageListener.processWidgetMessage(_loc2_);
         }
      }
      
      override public function get state() : int
      {
         if(_userChooser != null && _userChooser.isOpen())
         {
            return const_1409;
         }
         return const_1613;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChooserContentEvent.const_505,onChooserContent);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_244,onUpdateUserChooser);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_637,onUpdateUserChooser);
      }
      
      override public function dispose() : void
      {
         if(_userChooser != null)
         {
            _userChooser.dispose();
            _userChooser = null;
         }
         super.dispose();
      }
   }
}
