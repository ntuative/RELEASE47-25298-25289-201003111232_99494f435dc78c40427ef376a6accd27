package com.sulake.habbo.ui
{
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetInterstitialUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetLoadingBarUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class LoadingBarWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      public function LoadingBarWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_392;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_container == null || true)
         {
            return;
         }
         switch(param1.type)
         {
            case AdEvent.const_450:
               _loc2_ = param1 as AdEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               _loc3_ = new RoomWidgetInterstitialUpdateEvent(RoomWidgetInterstitialUpdateEvent.const_95,_loc2_.image,_loc2_.clickUrl);
               _container.events.dispatchEvent(_loc3_);
               break;
            case AdEvent.const_382:
               _container.setInterstitialCompleted();
               break;
            case RoomWidgetLoadingBarUpdateEvent.const_95:
               _container.events.dispatchEvent(param1);
               break;
            case RoomWidgetLoadingBarUpdateEvent.const_246:
               _container.events.dispatchEvent(param1);
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return [];
      }
      
      public function update() : void
      {
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(AdEvent.const_450);
         _loc1_.push(AdEvent.const_382);
         _loc1_.push(RoomWidgetLoadingBarUpdateEvent.const_95);
         _loc1_.push(RoomWidgetLoadingBarUpdateEvent.const_246);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
      }
   }
}
