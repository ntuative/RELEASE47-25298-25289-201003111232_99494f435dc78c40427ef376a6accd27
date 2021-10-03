package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class PetLogic extends MovingObjectLogic
   {
       
      
      private var var_333:Vector3d = null;
      
      private var _selected:Boolean = false;
      
      public function PetLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_410,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         var_333 = null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(var_333 == null || var_333.x != _loc2_.x || var_333.y != _loc2_.y || var_333.z != _loc2_.z)
               {
                  if(var_333 == null)
                  {
                     var_333 = new Vector3d();
                  }
                  var_333.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_463,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_204,_loc6_,_loc7_);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(object != null)
         {
            _loc2_ = object.getModelController();
            if(object.getType() == "pet")
            {
               if(param1 is RoomObjectAvatarUpdateMessage)
               {
                  _loc3_ = param1 as RoomObjectAvatarUpdateMessage;
                  if(_loc3_ != null)
                  {
                     _loc2_.setNumber(RoomObjectVariableEnum.const_335,_loc3_.dirHead);
                  }
               }
               if(param1 is RoomObjectAvatarFigureUpdateMessage)
               {
                  _loc4_ = param1 as RoomObjectAvatarFigureUpdateMessage;
                  _loc5_ = _loc2_.getString(RoomObjectVariableEnum.const_164);
                  _loc2_.setString(RoomObjectVariableEnum.const_164,_loc4_.figure);
                  _loc2_.setString(RoomObjectVariableEnum.const_1337,_loc4_.race);
               }
               if(param1 is RoomObjectAvatarWaveUpdateMessage)
               {
                  _loc6_ = param1 as RoomObjectAvatarWaveUpdateMessage;
                  if(_loc6_.isWaving)
                  {
                     _loc2_.setNumber(RoomObjectVariableEnum.const_337,new Date().valueOf());
                  }
                  else
                  {
                     _loc2_.setNumber(RoomObjectVariableEnum.const_337,-1);
                  }
               }
               if(param1 is RoomObjectAvatarSleepUpdateMessage)
               {
                  _loc7_ = param1 as RoomObjectAvatarSleepUpdateMessage;
                  _loc2_.setNumber(RoomObjectVariableEnum.const_414,Number(_loc7_.isSleeping));
               }
               if(param1 is RoomObjectAvatarPetGestureUpdateMessage)
               {
                  _loc8_ = param1 as RoomObjectAvatarPetGestureUpdateMessage;
                  _loc2_.setString(RoomObjectVariableEnum.const_359,_loc8_.gesture);
                  _loc2_.setNumber(RoomObjectVariableEnum.const_433,new Date().valueOf());
               }
               if(param1 is RoomObjectAvatarChatUpdateMessage)
               {
                  _loc9_ = param1 as RoomObjectAvatarChatUpdateMessage;
                  _loc2_.setNumber(RoomObjectVariableEnum.const_716,_loc9_.numberOfWords);
                  _loc2_.setNumber(RoomObjectVariableEnum.AVATAR_TALK_TIMESTAMP,new Date().valueOf());
               }
               if(param1 is RoomObjectAvatarPostureUpdateMessage)
               {
                  _loc10_ = param1 as RoomObjectAvatarPostureUpdateMessage;
                  _loc2_.setString(RoomObjectVariableEnum.const_239,_loc10_.postureType);
               }
               if(param1 is RoomObjectAvatarSelectedMessage)
               {
                  _loc11_ = param1 as RoomObjectAvatarSelectedMessage;
                  _selected = _loc11_.selected;
                  var_333 = null;
               }
               if(param1 is RoomObjectAvatarExperienceUpdateMessage)
               {
                  _loc12_ = param1 as RoomObjectAvatarExperienceUpdateMessage;
                  _loc2_.setNumber(RoomObjectVariableEnum.const_890,Number(getTimer()));
                  _loc2_.setNumber(RoomObjectVariableEnum.const_826,Number(_loc12_.gainedExperience));
               }
            }
         }
      }
   }
}
