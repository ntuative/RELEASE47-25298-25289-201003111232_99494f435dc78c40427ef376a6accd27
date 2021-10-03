package com.sulake.habbo.ui
{
   import com.sulake.habbo.friendlist.events.FriendRequestEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFriendRequestUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFriendRequestMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class FriendRequestWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _disposed:Boolean = false;
      
      public function FriendRequestWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_314;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetGetUserLocationMessage.const_598);
         _loc1_.push(RoomWidgetFriendRequestMessage.const_527);
         _loc1_.push(RoomWidgetFriendRequestMessage.const_681);
         return _loc1_;
      }
      
      public function update() : void
      {
         _container.events.dispatchEvent(new RoomWidgetFrameUpdateEvent());
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_container == null || true)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionFriendRequestEvent.const_110:
               _loc4_ = param1 as RoomSessionFriendRequestEvent;
               if(!_loc4_)
               {
                  return;
               }
               _loc3_ = "null";
               _loc2_ = new RoomWidgetFriendRequestUpdateEvent(_loc3_,_loc4_.requestId,_loc4_.userId,_loc4_.userName);
               break;
            case FriendRequestEvent.const_54:
            case FriendRequestEvent.const_235:
               _loc5_ = param1 as FriendRequestEvent;
               if(!_loc5_)
               {
                  return;
               }
               _loc3_ = "null";
               _loc2_ = new RoomWidgetFriendRequestUpdateEvent(_loc3_,_loc5_.requestId);
               break;
         }
         if(_loc2_)
         {
            _container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(!param1 || !_container)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetGetUserLocationMessage.const_598:
               _loc2_ = param1 as RoomWidgetGetUserLocationMessage;
               if(!_loc2_)
               {
                  return null;
               }
               _loc3_ = _container.roomSession;
               if(!_loc3_ || !_loc3_.userDataManager)
               {
                  return null;
               }
               _loc4_ = _loc3_.userDataManager.getUserData(_loc2_.userId);
               if(_loc4_)
               {
                  _loc5_ = _container.roomEngine.getRoomObjectBoundingRectangle(_loc3_.roomId,_loc3_.roomCategory,_loc4_.id,RoomObjectCategoryEnum.const_36,_container.getFirstCanvasId());
                  _loc8_ = _container.getRoomViewRect();
                  if(_loc5_ && _loc8_)
                  {
                     _loc5_.offset(_loc8_.x,_loc8_.y);
                  }
               }
               return new RoomWidgetUserLocationUpdateEvent(_loc2_.userId,_loc5_);
               break;
            case RoomWidgetFriendRequestMessage.const_527:
               _loc6_ = param1 as RoomWidgetFriendRequestMessage;
               if(!_loc6_ || true)
               {
                  return null;
               }
               _container.friendList.acceptFriendRequest(_loc6_.requestId);
               break;
            case RoomWidgetFriendRequestMessage.const_681:
               _loc7_ = param1 as RoomWidgetFriendRequestMessage;
               if(!_loc7_ || true)
               {
                  return null;
               }
               _container.friendList.declineFriendRequest(_loc7_.requestId);
               break;
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomSessionFriendRequestEvent.const_110);
         _loc1_.push(FriendRequestEvent.const_54);
         _loc1_.push(FriendRequestEvent.const_235);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         _container = null;
      }
   }
}
