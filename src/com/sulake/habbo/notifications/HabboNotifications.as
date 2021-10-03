package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.utils.XMLVariableParser;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.InfoHotelClosedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.availability.InfoHotelClosingMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.availability.LoginFailedHotelClosedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftSelectedEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetReceivedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ModMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.UserBannedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.ClubGiftNotificationEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboBroadcastMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.InfoFeedEnableMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.PetLevelNotificationEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.room.publicroom.ParkBusCannotEnterMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.RespectNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
   import com.sulake.habbo.communication.messages.parser.availability.InfoHotelClosedMessageParser;
   import com.sulake.habbo.communication.messages.parser.availability.InfoHotelClosingMessageParser;
   import com.sulake.habbo.communication.messages.parser.availability.LoginFailedHotelClosedMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftSelectedParser;
   import com.sulake.habbo.communication.messages.parser.catalog.PurchaseOKMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetReceivedMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.ModMessageParser;
   import com.sulake.habbo.communication.messages.parser.moderation.UserBannedMessageParser;
   import com.sulake.habbo.communication.messages.parser.notifications.ClubGiftNotificationParser;
   import com.sulake.habbo.communication.messages.parser.notifications.HabboBroadcastMessageParser;
   import com.sulake.habbo.communication.messages.parser.notifications.PetLevelNotificationParser;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.pets.PetRespectFailedParser;
   import com.sulake.habbo.communication.messages.parser.room.publicroom.ParkBusCannotEnterMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import iid.IIDHabboWindowManager;
   
   public class HabboNotifications extends Component implements IHabboNotifications, IUpdateReceiver, IGetImageListener
   {
      
      private static const const_1092:String = "badges";
      
      private static const const_1096:String = "pet_inventory";
      
      private static const const_1095:String = "pixelbalance";
      
      private static const const_1090:String = "credits";
      
      private static const const_1089:String = "inventory";
      
      private static const const_1094:String = "friendlist";
      
      private static const const_1091:String = "selectfurni";
      
      private static const const_1093:String = "selectbadge";
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_592:ParkBusDialogManager;
      
      private var var_591:IHabboToolbar;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_413:HabboNotificationViewManager;
      
      private var var_593:IAvatarRenderManager;
      
      private var var_2128:Boolean;
      
      private var var_356:ISessionDataManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1297:Boolean;
      
      private var var_10:IHabboInventory;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_883:Map;
      
      private var var_1059:Array;
      
      private var var_201:HabboAlertDialogManager;
      
      private var var_709:ClubGiftNotification;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _friendList:IHabboFriendList;
      
      public function HabboNotifications(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_1059 = new Array();
         var_883 = new Map();
         var_1297 = false;
         var _loc4_:IAsset = _assetLibrary.getAssetByName("habbo_notifications_config_xml");
         var _loc5_:XmlAsset = XmlAsset(_loc4_);
         if(_loc5_ != null)
         {
            XMLVariableParser.parseVariableList(XML(_loc5_.content).children(),var_883);
         }
         var _loc6_:Map = var_883["styles"];
         if(_loc6_ != null)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               _loc8_ = _loc6_.getWithIndex(_loc7_);
               if(_loc8_["icon"] != null)
               {
                  _loc9_ = _assetLibrary.getAssetByName(_loc8_["icon"]) as BitmapDataAsset;
                  _loc10_ = _loc9_.content as BitmapData;
                  _loc8_["icon"] = _loc10_;
               }
               _loc7_++;
            }
         }
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationComponentInit);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
      }
      
      public function addSongPlayingNotification(param1:String, param2:String) : void
      {
         _localization.registerParameter("soundmachine.notification.playing","songname",param1);
         _localization.registerParameter("soundmachine.notification.playing","songauthor",param2);
         var _loc3_:ILocalization = _localization.getLocalization("soundmachine.notification.playing");
         if(_loc3_)
         {
            addItem(_loc3_.value,NotificationType.const_1291);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _catalog = param2 as IHabboCatalog;
      }
      
      public function addOfflineNotification(param1:String, param2:String = "") : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2 == "")
         {
            _localization.registerParameter("notifications.text.friend.offline","user_name",param1);
            _loc4_ = _localization.getLocalization("notifications.text.friend.offline");
            _loc3_ = "null";
         }
         else
         {
            _localization.registerParameter("notifications.text.friend.offline.realname","user_name",param1);
            _localization.registerParameter("notifications.text.friend.offline.realname","real_name",param2);
            _loc4_ = _localization.getLocalization("notifications.text.friend.offline.realname");
            _loc3_ = "null";
         }
         if(_loc4_)
         {
            addItem(_loc4_.value,_loc3_);
         }
      }
      
      private function onClubGiftNotification(param1:ClubGiftNotificationEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:ClubGiftNotificationParser = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.numGifts < 1)
         {
            return;
         }
         if(var_709 && false)
         {
            return;
         }
         var_709 = new ClubGiftNotification(_loc2_.numGifts,_assets,_windowManager,_catalog);
      }
      
      private function onUserBannedMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:UserBannedMessageParser = (param1 as UserBannedMessageEvent).getParser();
         if(_loc2_ == null || var_201 == null)
         {
            return;
         }
         var_201.handleUserBannedMessage(_loc2_.message);
      }
      
      private function onBroadcastMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:HabboBroadcastMessageParser = (param1 as HabboBroadcastMessageEvent).getParser();
         var _loc3_:String = _loc2_.messageText;
         var _loc4_:RegExp = /\\r/g;
         _loc3_ = _loc3_.replace(_loc4_,"\r");
         _windowManager.alert("${notifications.broadcast.title}",_loc3_,0,onAlert);
      }
      
      private function onRecyclerFinished(param1:IMessageEvent) : void
      {
         var _loc2_:RecyclerFinishedMessageParser = (param1 as RecyclerFinishedMessageEvent).getParser();
         if(_loc2_ == null || _loc2_.recyclerFinishedStatus != RecyclerFinishedMessageEvent.const_948)
         {
            return;
         }
         var _loc3_:ILocalization = _localization.getLocalization("notifications.text.recycle.ok");
         if(_loc3_)
         {
            addItem(_loc3_.value,NotificationType.const_1217);
         }
         Logger.log("[HabboNotifications] recycle ok");
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_356 = param2 as ISessionDataManager;
      }
      
      private function onLoginFailedHotelClosed(param1:IMessageEvent) : void
      {
         var _loc2_:LoginFailedHotelClosedMessageParser = (param1 as LoginFailedHotelClosedMessageEvent).getParser();
         if(_loc2_ == null || var_201 == null)
         {
            return;
         }
         var_201.handleLoginFailedHotelClosedMessage(_loc2_.openHour,_loc2_.openMinute);
      }
      
      private function onModMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:ModMessageParser = (param1 as ModMessageEvent).getParser();
         if(_loc2_ == null || var_201 == null)
         {
            return;
         }
         var_201.handleModMessage(_loc2_.message,_loc2_.url);
      }
      
      private function getProductImage(param1:String, param2:int, param3:String) : BitmapData
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         switch(param1)
         {
            case CatalogPageMessageProductData.const_79:
               _loc5_ = _roomEngine.getFurnitureIcon(param2,this);
               break;
            case CatalogPageMessageProductData.const_77:
               _loc7_ = tempCategoryMapping("I",param2);
               if(_loc7_ == 1)
               {
                  _loc5_ = _roomEngine.getWallItemIcon(param2,this,param3);
               }
               else
               {
                  switch(_loc7_)
                  {
                     case FurniCategory.const_300:
                        _loc4_ = (var_10 as Component).assets.getAssetByName("icon_wallpaper_png") as BitmapDataAsset;
                        if(_loc4_ != null)
                        {
                           _loc6_ = (_loc4_.content as BitmapData).clone();
                        }
                        break;
                     case FurniCategory.const_324:
                        _loc4_ = (var_10 as Component).assets.getAssetByName("icon_landscape_png") as BitmapDataAsset;
                        if(_loc4_ != null)
                        {
                           _loc6_ = (_loc4_.content as BitmapData).clone();
                        }
                        break;
                     case FurniCategory.const_311:
                        _loc4_ = (var_10 as Component).assets.getAssetByName("icon_floor_png") as BitmapDataAsset;
                        if(_loc4_ != null)
                        {
                           _loc6_ = (_loc4_.content as BitmapData).clone();
                        }
                  }
                  _loc5_ = null;
               }
               break;
            case CatalogPageMessageProductData.const_201:
               _loc4_ = (var_10 as Component).assets.getAssetByName("fx_icon_" + param2 + "_png") as BitmapDataAsset;
               if(_loc4_ != null)
               {
                  _loc6_ = (_loc4_.content as BitmapData).clone();
               }
               break;
            default:
               Logger.log("[HabboNotifications] Can not yet handle this type of product: ");
         }
         if(_loc5_ != null)
         {
            _loc6_ = _loc5_.data;
         }
         return _loc6_;
      }
      
      function onActivityPointNotication(param1:IMessageEvent) : void
      {
         var _loc2_:HabboActivityPointNotificationMessageEvent = param1 as HabboActivityPointNotificationMessageEvent;
         Logger.log("Pixels received, count " + _loc2_.amount + ", change " + _loc2_.change);
         _localization.registerParameter("notifications.text.pixels","count",String(_loc2_.amount));
         _localization.registerParameter("notifications.text.pixels","change",String(_loc2_.change));
         var _loc3_:ILocalization = _localization.getLocalization("notifications.text.pixels");
         if(_loc3_ && _loc2_.change > 0)
         {
            addItem(_loc3_.value,NotificationType.const_1277);
         }
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         if(!var_2128)
         {
            _loc2_ = this._localization.getKey("mod.chatdisclaimer","NA");
            this.addItem(_loc2_,NotificationType.const_908);
            var_2128 = true;
            Logger.log("DISPLAYED MOD INFO: " + _loc2_);
         }
      }
      
      override public function dispose() : void
      {
         if(var_413 != null)
         {
            var_413.dispose();
            var_413 = null;
         }
         if(var_201 != null)
         {
            var_201.dispose();
            var_201 = null;
         }
         if(var_592 != null)
         {
            var_592.dispose();
            var_592 = null;
         }
         if(var_709 != null)
         {
            var_709.dispose();
            var_709 = null;
         }
         if(var_593)
         {
            var_593.release(new IIDAvatarRenderManager());
            var_593 = null;
         }
         if(_catalog)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_config)
         {
            _config.release(new IIDHabboConfigurationManager());
            _config = null;
         }
         if(_friendList)
         {
            _friendList.release(new IIDHabboFriendList());
            _friendList = null;
         }
         if(var_10)
         {
            var_10.release(new IIDHabboInventory());
            var_10 = null;
         }
         if(_localization)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(_roomEngine)
         {
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(var_356)
         {
            var_356.release(new IIDSessionDataManager());
            var_356 = null;
         }
         if(var_591)
         {
            var_591.release(new IIDHabboToolbar());
            var_591 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function onExecuteLink(param1:String) : void
      {
         switch(param1)
         {
            case const_1095:
               break;
            case const_1092:
               if(var_10 != null)
               {
                  var_10.toggleInventoryPage(InventoryCategory.const_234);
               }
               break;
            case const_1093:
               break;
            case const_1089:
               if(var_10 != null)
               {
                  var_10.toggleInventoryPage(InventoryCategory.const_72);
               }
               break;
            case const_1096:
               if(var_10)
               {
                  var_10.toggleInventoryPage(InventoryCategory.const_139);
               }
               break;
            case const_1091:
               break;
            case const_1090:
               break;
            case const_1094:
               if(_friendList != null)
               {
                  _friendList.openFriendList();
               }
         }
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         _communication = IHabboCommunicationManager(param2);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      private function onBadgeImage(param1:BadgeImageReadyEvent) : void
      {
         if(param1 != null && this.var_413 != null)
         {
            var_413.replaceIcon(param1);
         }
      }
      
      private function onClubGiftSelected(param1:ClubGiftSelectedEvent) : void
      {
         if(!param1 || !_localization)
         {
            return;
         }
         var _loc2_:ClubGiftSelectedParser = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Array = _loc2_.products;
         if(!_loc3_ || _loc3_.length == 0)
         {
            return;
         }
         var _loc4_:CatalogPageMessageProductData = _loc3_[0] as CatalogPageMessageProductData;
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:String = _localization.getKey("notifications.text.club_gift.received");
         var _loc6_:BitmapData = getProductImage(_loc4_.productType,_loc4_.furniClassId,_loc4_.extraParam);
         addItem(_loc5_,NotificationType.const_908,_loc6_);
      }
      
      private function onPetReceived(param1:PetReceivedMessageEvent) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:PetReceivedMessageParser = param1.getParser();
         if(_loc2_.boughtAsGift)
         {
            _loc3_ = _localization.getLocalization("notifications.text.petbought");
         }
         else
         {
            _loc3_ = _localization.getLocalization("notifications.text.petreceived");
         }
         var _loc4_:IAvatarImage = var_593.createPetImage(_loc2_.pet.figure,AvatarScaleType.const_52);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.setDirection(AvatarSetType.const_39,3);
         var _loc5_:BitmapData = _loc4_.getCroppedImage(AvatarSetType.const_47).clone();
         _loc4_.dispose();
         if(_loc3_)
         {
            addItem(_loc3_.value,NotificationType.const_940,_loc5_);
         }
      }
      
      public function onAlert(param1:IAlertDialog, param2:WindowEvent) : void
      {
         if(param2.type == WindowEvent.const_174 || param2.type == WindowEvent.const_715)
         {
            param1.dispose();
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _roomEngine = param2 as IRoomEngine;
      }
      
      public function update(param1:uint) : void
      {
         if(var_413.isSpaceAvailable() && false)
         {
            var_413.showItem(getNextItemFromQueue());
         }
      }
      
      private function onParkBusMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:ParkBusCannotEnterMessageParser = (param1 as ParkBusCannotEnterMessageEvent).getParser();
         if(var_592 == null)
         {
            var_592 = new ParkBusDialogManager(_windowManager,assets,_localization);
         }
         if(_loc2_ != null || var_592 != null)
         {
            var_592.handleParkBusCannotEnter(_loc2_.reason);
         }
      }
      
      private function getNextItemFromQueue() : HabboNotificationItem
      {
         var _loc1_:Array = var_1059.splice(0,1);
         return _loc1_[0] as HabboNotificationItem;
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _friendList = param2 as IHabboFriendList;
      }
      
      private function onPetLevelNotification(param1:PetLevelNotificationEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:PetLevelNotificationParser = param1.getParser();
         _localization.registerParameter("notifications.text.petlevel","pet_name",_loc2_.petName);
         _localization.registerParameter("notifications.text.petlevel","level",_loc2_.level.toString());
         var _loc3_:ILocalization = _localization.getLocalization("notifications.text.petlevel");
         var _loc4_:IAvatarImage = var_593.createPetImage(_loc2_.figure,AvatarScaleType.const_52);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.setDirection(AvatarSetType.const_39,3);
         var _loc5_:BitmapData = _loc4_.getCroppedImage(AvatarSetType.const_47).clone();
         _loc4_.dispose();
         if(_loc3_)
         {
            addItem(_loc3_.value,NotificationType.const_940,_loc5_);
         }
      }
      
      private function onPetRespectFailed(param1:IMessageEvent) : void
      {
         var _loc2_:PetRespectFailedParser = (param1 as PetRespectFailedEvent).getParser();
         this._localization.registerParameter("room.error.pets.respectfailed","required_age","" + _loc2_.requiredDays);
         this._localization.registerParameter("room.error.pets.respectfailed","avatar_age","" + _loc2_.avatarAgeInDays);
         _windowManager.alert("${error.title}","${room.error.pets.respectfailed}",0,onAlert);
      }
      
      private function onInfoFeedEnable(param1:IMessageEvent) : void
      {
         var _loc2_:InfoFeedEnableMessageEvent = param1 as InfoFeedEnableMessageEvent;
         if(_loc2_ != null)
         {
            var_1297 = !_loc2_.enabled;
         }
      }
      
      function onAchievementNotication(param1:IMessageEvent) : void
      {
         var _loc2_:HabboAchievementNotificationMessageEvent = param1 as HabboAchievementNotificationMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         new AchievementNotification(_loc2_.badgeID,_loc2_.level,_assets,_windowManager,_localization,_config,var_356);
      }
      
      private function onPurchaseOK(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc2_:PurchaseOKMessageEvent = param1 as PurchaseOKMessageEvent;
         var _loc3_:PurchaseOKMessageParser = _loc2_.getParser();
         var _loc4_:CatalogPageMessageOfferData = _loc3_.offer;
         var _loc5_:* = null;
         if(_loc4_ != null)
         {
            _loc9_ = _loc4_.offerId;
            _loc10_ = _loc4_.localizationId;
            _loc11_ = _loc4_.priceInCredits;
            _loc12_ = _loc4_.priceInPixels;
            _loc13_ = new Array();
            _loc14_ = _loc4_.products[0];
            if(_loc4_.products.length > 0)
            {
               if(_loc14_.productType == CatalogPageMessageProductData.const_79)
               {
                  _loc15_ = var_356.getFloorItemData(_loc14_.furniClassId);
               }
               else if(_loc14_.productType == CatalogPageMessageProductData.const_77)
               {
                  _loc15_ = var_356.getWallItemData(_loc14_.furniClassId);
               }
               _loc6_ = var_356.getProductData(_loc4_.localizationId);
               _loc5_ = getProductImage(_loc14_.productType,_loc14_.furniClassId,_loc14_.extraParam);
            }
         }
         var _loc7_:String = _loc6_ == null ? "product" : _loc6_.name;
         _localization.registerParameter("notifications.text.purchase.ok","productName",_loc7_);
         var _loc8_:ILocalization = _localization.getLocalization("notifications.text.purchase.ok");
         if(_loc8_)
         {
            addItem(_loc8_.value,NotificationType.const_1166,_loc5_);
         }
         Logger.log("[HabboNotifications] purchase ok");
      }
      
      public function addOnlineNotification(param1:String, param2:String, param3:String = "") : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc4_:* = null;
         var _loc7_:IAvatarImage = var_593.createAvatarImage(param2,AvatarScaleType.const_52);
         if(_loc7_ != null)
         {
            _loc7_.setDirection(AvatarSetType.const_47,3);
            _loc4_ = _loc7_.getCroppedImage(AvatarSetType.const_47);
         }
         if(param3 == "")
         {
            _localization.registerParameter("notifications.text.friend.online","user_name",param1);
            _loc5_ = _localization.getLocalization("notifications.text.friend.online");
            _loc6_ = "null";
         }
         else
         {
            _localization.registerParameter("notifications.text.friend.online.realname","user_name",param1);
            _loc5_ = _localization.getLocalization("notifications.text.friend.online.realname");
            _localization.registerParameter("notifications.text.friend.online.realname","real_name",param3);
            _loc5_ = _localization.getLocalization("notifications.text.friend.online.realname");
            _loc6_ = "null";
            _loc9_ = _assets.getAssetByName("if_icon_friend_bg_blue_png") as BitmapDataAsset;
            if(_loc9_ != null)
            {
               _loc8_ = (_loc9_.content as BitmapData).clone();
               _loc8_.copyPixels(_loc4_,_loc4_.rect,new Point((_loc8_.width - _loc4_.width) / 2,(_loc8_.height - _loc4_.height) / 2),null,null,true);
               _loc4_ = _loc8_;
            }
         }
         if(_loc5_)
         {
            addItem(_loc5_.value,_loc6_,_loc4_);
         }
      }
      
      public function addItem(param1:String, param2:String, param3:BitmapData = null, param4:String = null) : int
      {
         if(var_1297)
         {
            return 0;
         }
         var _loc5_:Map = var_883["styles"];
         if(_loc5_ == null)
         {
            return 0;
         }
         var _loc6_:Map = _loc5_[param2];
         if(_loc6_ == null)
         {
            return 0;
         }
         var _loc7_:HabboNotificationItemStyle = new HabboNotificationItemStyle(_loc6_);
         if(param3 != null)
         {
            _loc7_.icon = param3;
         }
         _loc7_.iconSrc = param4;
         var _loc8_:HabboNotificationItem = new HabboNotificationItem(param1,_loc7_,this);
         var_1059.push(_loc8_);
         return var_1059.length;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_10 = param2 as IHabboInventory;
      }
      
      private function onToolbarRepositionEvent(param1:HabboToolbarEvent) : void
      {
      }
      
      private function onSubscriptionInfo(param1:IMessageEvent) : void
      {
         var _loc5_:* = null;
         Logger.log("[HabboNotifications] subscription update");
         var _loc2_:ScrSendUserInfoMessageParser = (param1 as ScrSendUserInfoEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.responseType != 2)
         {
            return;
         }
         var _loc3_:int = Math.max(0,_loc2_.daysToPeriodEnd);
         var _loc4_:int = Math.max(0,_loc2_.periodsSubscribedAhead);
         if(_loc4_ > 0)
         {
            _localization.registerParameter("notifications.text.clubdays.long","days",String(_loc3_));
            _localization.registerParameter("notifications.text.clubdays.long","months",String(_loc4_));
            _loc5_ = _localization.getLocalization("notifications.text.clubdays.long");
         }
         else
         {
            _localization.registerParameter("notifications.text.clubdays","days",String(_loc3_));
            _loc5_ = _localization.getLocalization("notifications.text.clubdays");
         }
         if(_loc5_)
         {
            addItem(_loc5_.value,NotificationType.const_230);
         }
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
         var_201 = new HabboAlertDialogManager(_windowManager,_localization);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _config = param2 as IHabboConfigurationManager;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_591 = IHabboToolbar(param2);
         var_591.events.addEventListener(HabboToolbarEvent.const_85,onHabboToolbarEvent);
      }
      
      private function onHotelClosing(param1:IMessageEvent) : void
      {
         var _loc2_:InfoHotelClosingMessageParser = (param1 as InfoHotelClosingMessageEvent).getParser();
         if(_loc2_ == null || var_201 == null)
         {
            return;
         }
         var_201.handleHotelClosingMessage(_loc2_.minutesUntilClosing);
      }
      
      function onRespectNotification(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:RespectNotificationMessageEvent = param1 as RespectNotificationMessageEvent;
         if(this.var_356.userId == _loc2_.userId)
         {
            _localization.registerParameter("notifications.text.respect.2","count",String(_loc2_.respectTotal));
            _loc3_ = _localization.getLocalization("notifications.text.respect.1");
            _loc4_ = _localization.getLocalization("notifications.text.respect.2");
            if(_loc3_)
            {
               addItem(_loc3_.value,NotificationType.const_881);
            }
            if(_loc4_)
            {
               addItem(_loc4_.value,NotificationType.const_881);
            }
         }
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_593 = param2 as IAvatarRenderManager;
      }
      
      private function onHotelClosed(param1:IMessageEvent) : void
      {
         var _loc2_:InfoHotelClosedMessageParser = (param1 as InfoHotelClosedMessageEvent).getParser();
         if(_loc2_ == null || var_201 == null)
         {
            return;
         }
         var_201.handleHotelClosedMessage(_loc2_.openHour,_loc2_.openMinute,_loc2_.userThrownOutAtClose);
      }
      
      private function tempCategoryMapping(param1:String, param2:int) : int
      {
         if(param1 == "S")
         {
            return 1;
         }
         if(param1 == "I")
         {
            if(param2 == 3001)
            {
               return FurniCategory.const_300;
            }
            if(param2 == 3002)
            {
               return FurniCategory.const_311;
            }
            if(param2 == 4057)
            {
               return FurniCategory.const_324;
            }
            return 1;
         }
         return 1;
      }
      
      public function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_85)
         {
            Logger.log("Notifications: starting to respond to notifications");
            var_413 = new HabboNotificationViewManager(_assetLibrary,_windowManager,var_883["styles"],var_883["view"],var_591);
            _communication.addHabboConnectionMessageEvent(new HabboBroadcastMessageEvent(onBroadcastMessageEvent));
            _communication.addHabboConnectionMessageEvent(new HabboAchievementNotificationMessageEvent(onAchievementNotication));
            _communication.addHabboConnectionMessageEvent(new HabboActivityPointNotificationMessageEvent(onActivityPointNotication));
            _communication.addHabboConnectionMessageEvent(new RespectNotificationMessageEvent(onRespectNotification));
            _communication.addHabboConnectionMessageEvent(new PurchaseOKMessageEvent(onPurchaseOK));
            _communication.addHabboConnectionMessageEvent(new RecyclerFinishedMessageEvent(onRecyclerFinished));
            _communication.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(onSubscriptionInfo));
            _communication.addHabboConnectionMessageEvent(new InfoFeedEnableMessageEvent(onInfoFeedEnable));
            _communication.addHabboConnectionMessageEvent(new ModMessageEvent(onModMessageEvent));
            _communication.addHabboConnectionMessageEvent(new UserBannedMessageEvent(onUserBannedMessageEvent));
            _communication.addHabboConnectionMessageEvent(new InfoHotelClosingMessageEvent(onHotelClosing));
            _communication.addHabboConnectionMessageEvent(new InfoHotelClosedMessageEvent(onHotelClosed));
            _communication.addHabboConnectionMessageEvent(new LoginFailedHotelClosedMessageEvent(onLoginFailedHotelClosed));
            _communication.addHabboConnectionMessageEvent(new ParkBusCannotEnterMessageEvent(onParkBusMessageEvent));
            _communication.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(onRoomEnter));
            _communication.addHabboConnectionMessageEvent(new PetLevelNotificationEvent(onPetLevelNotification));
            _communication.addHabboConnectionMessageEvent(new PetReceivedMessageEvent(onPetReceived));
            _communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(onPetRespectFailed));
            _communication.addHabboConnectionMessageEvent(new ClubGiftNotificationEvent(onClubGiftNotification));
            _communication.addHabboConnectionMessageEvent(new ClubGiftSelectedEvent(onClubGiftSelected));
            registerUpdateReceiver(var_413,1);
            registerUpdateReceiver(this,2);
            var_356.events.addEventListener(BadgeImageReadyEvent.const_132,onBadgeImage);
            var_591.events.addEventListener(HabboToolbarEvent.TOOLBAR_ORIENTATION,onToolbarRepositionEvent);
            return;
         }
      }
   }
}
