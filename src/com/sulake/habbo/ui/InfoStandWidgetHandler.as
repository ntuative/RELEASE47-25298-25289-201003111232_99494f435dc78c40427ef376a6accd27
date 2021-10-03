package com.sulake.habbo.ui
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendlist.IFriend;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.IPetInfo;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
   import com.sulake.habbo.session.events.UserTagsReceivedEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomTagSearchMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class InfoStandWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      private var var_601:Map;
      
      public function InfoStandWidgetHandler()
      {
         var_601 = new Map();
         super();
      }
      
      private function onUserTags(param1:UserTagsReceivedEvent) : void
      {
         dispatchUserTags(param1.userId,param1.tags);
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(_container != null)
         {
            if(false)
            {
               _container.sessionDataManager.events.removeEventListener(UserTagsReceivedEvent.const_147,onUserTags);
               _container.sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.const_132,onBadgeImage);
            }
            if(false)
            {
               _container.roomSessionManager.events.removeEventListener(RoomSessionUserFigureUpdateEvent.const_146,onFigureUpdate);
               _container.roomSessionManager.events.removeEventListener(RoomSessionPetInfoUpdateEvent.PET_INFO,onPetInfo);
               _container.roomSessionManager.events.removeEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,onPetCommands);
            }
         }
         _container = param1;
         if(param1 == null)
         {
            return;
         }
         if(false)
         {
            _container.sessionDataManager.events.addEventListener(UserTagsReceivedEvent.const_147,onUserTags);
            _container.sessionDataManager.events.addEventListener(BadgeImageReadyEvent.const_132,onBadgeImage);
         }
         if(false)
         {
            _container.roomSessionManager.events.addEventListener(RoomSessionUserFigureUpdateEvent.const_146,onFigureUpdate);
            _container.roomSessionManager.events.addEventListener(RoomSessionPetInfoUpdateEvent.PET_INFO,onPetInfo);
            _container.roomSessionManager.events.addEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,onPetCommands);
         }
      }
      
      private function handleGetObjectInfoMessage(param1:RoomWidgetRoomObjectMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:Boolean = false;
         var _loc26_:* = false;
         var _loc27_:Boolean = false;
         var _loc28_:int = 0;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:int = 0;
         var _loc32_:* = null;
         var _loc33_:* = null;
         _loc2_ = _container.roomSession.roomId;
         _loc3_ = _container.roomSession.roomCategory;
         switch(param1.category)
         {
            case RoomObjectCategoryEnum.const_31:
            case RoomObjectCategoryEnum.const_30:
               if(true || true)
               {
                  return null;
               }
               if(param1.id < 0)
               {
                  return null;
               }
               _loc4_ = 4282203453;
               _loc5_ = _container.roomEngine.getRoomObjectImage(_loc2_,_loc3_,param1.id,param1.category,new Vector3d(180),32,null,_loc4_);
               _loc6_ = new RoomWidgetFurniInfoUpdateEvent(RoomWidgetFurniInfoUpdateEvent.const_615);
               _loc6_.id = param1.id;
               _loc6_.category = param1.category;
               _loc7_ = _container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc7_ == null || _loc7_.getModel() == null)
               {
                  return null;
               }
               _loc8_ = _loc7_.getType();
               if(_loc8_.indexOf("poster") == 0)
               {
                  _loc21_ = int(_loc8_.replace("poster",""));
                  _loc6_.name = "${poster_" + _loc21_ + "_name}";
                  _loc6_.description = "${poster_" + _loc21_ + "_desc}";
               }
               else
               {
                  _loc22_ = _loc7_.getModel().getNumber(RoomObjectVariableEnum.const_320);
                  if(param1.category == RoomObjectCategoryEnum.const_31)
                  {
                     _loc23_ = _container.sessionDataManager.getFloorItemData(_loc22_);
                  }
                  else if(param1.category == RoomObjectCategoryEnum.const_30)
                  {
                     _loc23_ = _container.sessionDataManager.getWallItemData(_loc22_);
                  }
                  if(_loc23_ != null)
                  {
                     _loc6_.name = _loc23_.title;
                     _loc6_.description = _loc23_.description;
                  }
               }
               if(_loc8_.indexOf("post_it") > -1)
               {
                  _loc6_.isStickie = true;
               }
               _loc6_.image = _loc5_.data;
               _loc9_ = _loc7_.getModel().getNumber(RoomObjectVariableEnum.const_788);
               _loc10_ = _loc7_.getModel().getNumber(RoomObjectVariableEnum.const_811);
               _loc6_.expiration = _loc9_ - (getTimer() - _loc10_) / 60000;
               _loc6_.isWallItem = param1.category == RoomObjectCategoryEnum.const_30;
               _loc6_.isRoomOwner = _container.roomSession.isRoomOwner;
               _loc6_.isRoomController = _container.roomSession.isRoomController;
               _loc6_.isAnyRoomController = _container.sessionDataManager.isAnyRoomController;
               _container.events.dispatchEvent(_loc6_);
               break;
            case RoomObjectCategoryEnum.const_36:
               if(true || true || true || true || true || true)
               {
                  return null;
               }
               _loc11_ = _container.roomSession.userDataManager.getUserDataByIndex(param1.id);
               if(_loc11_ == null)
               {
                  return null;
               }
               if(_loc11_.type == RoomObjectTypeEnum.const_336)
               {
                  _container.roomSession.userDataManager.requestPetInfo(_loc11_.webID);
                  return null;
               }
               if(_loc11_.type == RoomObjectTypeEnum.const_405)
               {
                  _loc12_ = "null";
                  if(_loc11_.webID != _container.sessionDataManager.userId)
                  {
                     _loc12_ = "null";
                  }
               }
               else
               {
                  if(_loc11_.type != RoomObjectTypeEnum.const_950)
                  {
                     return null;
                  }
                  _loc12_ = "null";
               }
               _loc13_ = new RoomWidgetUserInfoUpdateEvent(_loc12_);
               _loc13_.isSpectatorMode = _container.roomSession.isSpectatorMode;
               _loc13_.name = _loc11_.name;
               _loc13_.motto = _loc11_.custom;
               _loc13_.webID = _loc11_.webID;
               _loc13_.userRoomId = param1.id;
               _loc14_ = new Array();
               _loc16_ = _container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc16_ != null)
               {
                  _loc13_.carryItem = _loc16_.getModel().getNumber(RoomObjectVariableEnum.const_546);
               }
               if(_loc12_ == RoomWidgetUserInfoUpdateEvent.const_197)
               {
                  _loc13_.realName = _container.sessionDataManager.realName;
               }
               if(_loc12_ == RoomWidgetUserInfoUpdateEvent.const_226)
               {
                  _loc13_.canBeAskedAsFriend = _container.friendList.canBeAskedForAFriend(_loc11_.webID);
                  _loc24_ = _container.friendList.getFriend(_loc11_.webID);
                  if(_loc24_ != null)
                  {
                     _loc13_.realName = _loc24_.realName;
                  }
                  if(_loc16_ != null)
                  {
                     _loc30_ = _loc16_.getModel().getString(RoomObjectVariableEnum.const_520);
                     _loc13_.hasFlatControl = _loc30_ == "onlyfurniture" || _loc30_ == "useradmin" || _loc30_ == "";
                     _loc13_.canBeKicked = _container.roomSession.isPrivateRoom;
                  }
                  _loc13_.isIgnored = _container.sessionDataManager.isIgnored(_loc11_.name);
                  _loc13_.amIOwner = _container.roomSession.isRoomOwner;
                  _loc13_.amIController = _container.roomSession.isRoomController;
                  _loc13_.amIAnyRoomController = _container.sessionDataManager.isAnyRoomController;
                  _loc13_.respectLeft = _container.sessionDataManager.respectLeft;
                  _loc25_ = _container.sessionDataManager.hasUserRight("fuse_trade");
                  _loc26_ = !_container.sessionDataManager.systemShutDown;
                  _loc27_ = _container.roomSession.isTradingRoom;
                  _loc13_.canTrade = _loc25_ && _loc26_ && _loc27_;
                  _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_1311;
                  if(!_loc25_)
                  {
                     _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.TRADE_REASON_NO_OWN_RIGHT;
                  }
                  if(!_loc26_)
                  {
                     _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_918;
                  }
                  if(!_loc27_)
                  {
                     _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_858;
                  }
                  _loc28_ = _container.sessionDataManager.userId;
                  _loc29_ = _container.sessionDataManager.getUserTags(_loc28_);
                  dispatchUserTags(_loc28_,_loc29_);
               }
               if(_loc12_ == RoomWidgetUserInfoUpdateEvent.BOT)
               {
                  _loc13_.canBeKicked = _container.roomSession.isRoomOwner;
                  _loc14_.push(RoomWidgetUserInfoUpdateEvent.const_1154);
               }
               else
               {
                  _loc14_ = _container.roomSession.userDataManager.getUserBadges(_loc11_.webID);
                  _loc15_ = _container.sessionDataManager.getGroupBadgeId(int(_loc11_.groupID));
                  _loc13_.groupId = int(_loc11_.groupID);
                  _loc13_.groupBadgeId = _loc15_;
               }
               _loc13_.badges = _loc14_;
               _loc17_ = _loc11_.figure;
               _loc18_ = _container.avatarRenderManager.createAvatarImage(_loc17_,AvatarScaleType.const_52);
               if(_loc18_ != null)
               {
                  _loc18_.setDirection(AvatarSetType.const_39,4);
                  _loc13_.image = _loc18_.getImage(AvatarSetType.const_39);
               }
               _container.events.dispatchEvent(_loc13_);
               _loc19_ = _container.sessionDataManager.getUserTags(_loc11_.webID);
               dispatchUserTags(_loc11_.webID,_loc19_);
               _loc31_ = 0;
               while(_loc31_ < _loc14_.length)
               {
                  _loc32_ = _loc14_[_loc31_];
                  _loc20_ = _container.sessionDataManager.getBadgeImage(_loc32_);
                  if(_loc20_ != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc32_,_loc20_));
                  }
                  _loc31_++;
               }
               if(_loc15_ != null)
               {
                  _loc33_ = _container.sessionDataManager.getGroupBadgeImage(_loc15_);
                  if(_loc33_ != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc15_,_loc33_));
                  }
               }
               break;
         }
         return null;
      }
      
      public function update() : void
      {
      }
      
      private function onFigureUpdate(param1:RoomSessionUserFigureUpdateEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = false;
         if(_container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.userId < 0)
         {
            return;
         }
         var _loc2_:IUserData = _container.roomSession.userDataManager.getUserDataByIndex(param1.userId);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.webID;
         var _loc4_:* = null;
         if(false)
         {
            _loc5_ = _container.avatarRenderManager.createAvatarImage(param1.figure,AvatarScaleType.const_52);
            if(_loc5_ != null)
            {
               _loc5_.setDirection(AvatarSetType.const_39,4);
               _loc4_ = _loc5_.getImage(AvatarSetType.const_39);
            }
            _loc6_ = _loc3_ == _container.sessionDataManager.userId;
            if(_container != null && false)
            {
               _container.events.dispatchEvent(new RoomWidgetUserFigureUpdateEvent(_loc3_,_loc4_,_loc6_));
            }
         }
      }
      
      private function onPetInfo(param1:RoomSessionPetInfoUpdateEvent) : void
      {
         var _loc8_:* = false;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc2_:IPetInfo = param1.method_12;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IUserData = _container.roomSession.userDataManager.getUserData(_loc2_.petId);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:String = _loc3_.figure;
         var _loc5_:IAvatarImage = var_601.getValue(_loc2_.petId) as IAvatarImage;
         if(_loc5_ == null)
         {
            _loc5_ = _container.avatarRenderManager.createPetImage(_loc4_,AvatarScaleType.const_52);
            var_601.add(_loc2_.petId,_loc5_);
         }
         var _loc6_:int = _loc5_.petType;
         var _loc7_:int = _loc5_.petRace;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.setDirection(AvatarSetType.const_39,4);
         if(_container != null && false)
         {
            _loc8_ = _loc2_.ownerId == _container.sessionDataManager.userId;
            _loc9_ = new RoomWidgetPetInfoUpdateEvent(_loc6_,_loc7_,_loc3_.name,_loc2_.petId,_loc5_.getCroppedImage(AvatarSetType.const_39),_loc8_,_loc2_.ownerId,_loc2_.ownerName,_loc3_.id);
            _loc9_.level = _loc2_.level;
            _loc9_.levelMax = _loc2_.levelMax;
            _loc9_.experience = _loc2_.experience;
            _loc9_.experienceMax = _loc2_.experienceMax;
            _loc9_.energy = _loc2_.energy;
            _loc9_.energyMax = _loc2_.energyMax;
            _loc9_.nutrition = _loc2_.nutrition;
            _loc9_.nutritionMax = _loc2_.nutritionMax;
            _loc9_.petRespect = _loc2_.respect;
            _loc9_.petRespectLeft = _container.sessionDataManager.petRespectLeft;
            _loc9_.age = _loc2_.age;
            _loc10_ = false;
            _loc11_ = _container.roomSession.roomId;
            _loc12_ = _container.roomSession.roomCategory;
            _loc13_ = _container.roomSession.userDataManager.getUserData(_loc2_.ownerId);
            if(_loc13_ != null)
            {
               _loc14_ = _container.roomEngine.getRoomObject(_loc11_,_loc12_,_loc13_.id,RoomObjectCategoryEnum.const_36);
               if(_loc14_ != null)
               {
                  _loc15_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_520);
                  _loc10_ = (_container.roomSession.isRoomOwner || _container.roomSession.isRoomController || _container.sessionDataManager.isAnyRoomController) && _loc15_ != "useradmin" && _container.roomSession.isPrivateRoom && !_loc8_;
               }
            }
            _loc9_.canOwnerBeKicked = _loc10_;
            _container.events.dispatchEvent(_loc9_);
         }
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionUserBadgesEvent.const_122];
      }
      
      private function dispatchUserTags(param1:int, param2:Array) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:* = false;
         if(false)
         {
            _loc3_ = param1 == _container.sessionDataManager.userId;
         }
         if(_container != null && false)
         {
            _container.events.dispatchEvent(new RoomWidgetUserTagsUpdateEvent(param1,param2,_loc3_));
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomObjectMessage.const_338);
         _loc1_.push(RoomWidgetUserActionMessage.const_678);
         _loc1_.push(RoomWidgetUserActionMessage.const_690);
         _loc1_.push(RoomWidgetUserActionMessage.const_543);
         _loc1_.push(RoomWidgetUserActionMessage.const_571);
         _loc1_.push(RoomWidgetUserActionMessage.const_667);
         _loc1_.push(RoomWidgetUserActionMessage.const_435);
         _loc1_.push(RoomWidgetUserActionMessage.const_566);
         _loc1_.push(RoomWidgetUserActionMessage.const_619);
         _loc1_.push(RoomWidgetUserActionMessage.const_687);
         _loc1_.push(RoomWidgetUserActionMessage.const_551);
         _loc1_.push(RoomWidgetUserActionMessage.const_574);
         _loc1_.push(RoomWidgetFurniActionMessage.const_274);
         _loc1_.push(RoomWidgetFurniActionMessage.const_668);
         _loc1_.push(RoomWidgetFurniActionMessage.const_666);
         _loc1_.push(RoomWidgetRoomTagSearchMessage.const_723);
         _loc1_.push(RoomWidgetGetBadgeDetailsMessage.const_526);
         _loc1_.push(RoomWidgetUserActionMessage.const_407);
         _loc1_.push(RoomWidgetUserActionMessage.const_720);
         _loc1_.push(RoomWidgetUserActionMessage.const_533);
         _loc1_.push(RoomWidgetUserActionMessage.const_1215);
         _loc1_.push(RoomWidgetPetCommandMessage.const_630);
         _loc1_.push(RoomWidgetPetCommandMessage.const_635);
         _loc1_.push(RoomWidgetUserActionMessage.const_646);
         _loc1_.push(RoomWidgetUserActionMessage.const_403);
         return _loc1_;
      }
      
      private function onPetCommands(param1:RoomSessionPetCommandsUpdateEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         if(_container != null && false)
         {
            _loc2_ = _container.roomSession.isRoomOwner;
            _loc3_ = new RoomWidgetPetCommandsUpdateEvent(param1.petId,param1.enabledCommands);
            _container.events.dispatchEvent(_loc3_);
         }
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         switch(param1.type)
         {
            case RoomSessionUserBadgesEvent.const_122:
               _loc2_ = param1 as RoomSessionUserBadgesEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               _container.events.dispatchEvent(new RoomWidgetUserBadgesUpdateEvent(_loc2_.userId,_loc2_.badges));
               _loc4_ = 0;
               while(_loc4_ < _loc2_.badges.length)
               {
                  _loc5_ = _loc2_.badges[_loc4_];
                  _loc3_ = _container.sessionDataManager.getBadgeImage(_loc5_);
                  if(_loc3_ != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc5_,_loc3_));
                  }
                  _loc4_++;
               }
               break;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_601 != null)
         {
            _loc1_ = var_601.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_601.getValue(_loc2_);
               if(_loc3_)
               {
                  _loc3_.dispose();
               }
               _loc3_ = null;
            }
            var_601 = null;
         }
         _isDisposed = true;
         container = null;
      }
      
      private function onBadgeImage(param1:BadgeImageReadyEvent) : void
      {
         if(_container != null && false)
         {
            _container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(param1.badgeId,param1.badgeImage));
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_355;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(param1 == null)
         {
            return null;
         }
         if(_container == null)
         {
            return null;
         }
         var _loc2_:int = 0;
         _loc4_ = param1 as RoomWidgetUserActionMessage;
         if(_loc4_ != null)
         {
            _loc2_ = _loc4_.userId;
            if(_loc4_.type == RoomWidgetUserActionMessage.const_407)
            {
               _loc3_ = _container.roomSession.userDataManager.getUserDataByIndex(_loc2_);
            }
            else
            {
               _loc3_ = _container.roomSession.userDataManager.getUserData(_loc2_);
            }
            if(_loc3_ == null)
            {
               return null;
            }
         }
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:RoomWidgetFurniActionMessage = param1 as RoomWidgetFurniActionMessage;
         if(_loc7_ != null)
         {
            _loc5_ = _loc7_.furniId;
            _loc6_ = _loc7_.furniCategory;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomObjectMessage.const_338:
               return handleGetObjectInfoMessage(param1 as RoomWidgetRoomObjectMessage);
            case RoomWidgetUserActionMessage.const_678:
               _container.friendList.askForAFriend(_loc2_,_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_690:
               _container.sessionDataManager.giveRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_646:
               _container.sessionDataManager.givePetRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_543:
               _loc8_ = new RoomWidgetChatInputContentUpdateEvent(RoomWidgetChatInputContentUpdateEvent.const_817,_loc3_.name);
               _container.events.dispatchEvent(_loc8_);
               break;
            case RoomWidgetUserActionMessage.const_571:
               _container.sessionDataManager.ignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_667:
               _container.sessionDataManager.unignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_435:
               _container.roomSession.kickUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_566:
               _container.roomSession.banUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_619:
               _container.roomSession.assignRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_687:
               _container.roomSession.removeRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_551:
               _loc9_ = _container.roomSession.userDataManager.getUserData(_loc4_.userId);
               _container.inventory.setupTrading(_loc9_.id,_loc9_.name);
               break;
            case RoomWidgetUserActionMessage.const_574:
               _container.sessionDataManager.openHabboHomePage(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_533:
               _container.roomSession.pickUpPet(_loc2_);
               break;
            case RoomWidgetFurniActionMessage.const_668:
               _container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE);
               break;
            case RoomWidgetFurniActionMessage.const_274:
               _container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_MOVE);
               break;
            case RoomWidgetFurniActionMessage.const_666:
               _container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_PICKUP);
               break;
            case RoomWidgetUserActionMessage.const_403:
               if(false && _container.roomSession.userDataManager != null)
               {
                  _container.roomSession.userDataManager.requestPetInfo(_loc2_);
               }
               break;
            case RoomWidgetRoomTagSearchMessage.const_723:
               _loc10_ = param1 as RoomWidgetRoomTagSearchMessage;
               if(_loc10_ == null)
               {
                  return null;
               }
               _container.navigator.performTagSearch(_loc10_.tag);
               break;
            case RoomWidgetGetBadgeDetailsMessage.const_526:
               _loc11_ = param1 as RoomWidgetGetBadgeDetailsMessage;
               if(_loc11_ == null)
               {
                  return null;
               }
               _container.sessionDataManager.showGroupBadgeInfo(_loc11_.groupId);
               break;
            case RoomWidgetUserActionMessage.const_407:
               _container.roomSession.kickBot(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_720:
               if(_container == null || true)
               {
                  break;
               }
               if(_loc3_ == null)
               {
                  break;
               }
               _container.habboHelp.reportUser(_loc2_,_loc3_.name);
               break;
            case RoomWidgetPetCommandMessage.const_635:
               _loc12_ = param1 as RoomWidgetPetCommandMessage;
               _container.roomSession.requestPetCommands(_loc12_.petId);
               break;
            case RoomWidgetPetCommandMessage.const_630:
               _loc13_ = param1 as RoomWidgetPetCommandMessage;
               _container.roomSession.sendChatMessage(_loc13_.value);
         }
         return null;
      }
   }
}
