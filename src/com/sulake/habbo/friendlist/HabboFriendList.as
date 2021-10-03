package com.sulake.habbo.friendlist
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptBuddyFailureData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptBuddyResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.BuddyRequestsEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FollowFriendFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewBuddyRequestEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.FriendListUpdateMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.GetBuddyRequestsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.MessengerInitMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.RequestBuddyMessageComposer;
   import com.sulake.habbo.communication.messages.parser.friendlist.AcceptBuddyResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.BuddyRequestsMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.FollowFriendFailedMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.MessengerErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.NewBuddyRequestMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.domain.AvatarSearchDeps;
   import com.sulake.habbo.friendlist.domain.AvatarSearchResults;
   import com.sulake.habbo.friendlist.domain.Friend;
   import com.sulake.habbo.friendlist.domain.FriendCategories;
   import com.sulake.habbo.friendlist.domain.FriendCategoriesDeps;
   import com.sulake.habbo.friendlist.domain.FriendCategory;
   import com.sulake.habbo.friendlist.domain.FriendListTab;
   import com.sulake.habbo.friendlist.domain.FriendListTabs;
   import com.sulake.habbo.friendlist.domain.FriendListTabsDeps;
   import com.sulake.habbo.friendlist.domain.FriendRequest;
   import com.sulake.habbo.friendlist.domain.FriendRequests;
   import com.sulake.habbo.friendlist.domain.FriendRequestsDeps;
   import com.sulake.habbo.friendlist.events.HabboFriendListTrackingEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.messenger.IHabboMessenger;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboMessenger;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendList extends Component implements IHabboFriendList
   {
      
      public static const const_180:String = "face";
       
      
      private var var_493:Timer;
      
      private var var_155:IHabboConfigurationManager;
      
      private var var_1521:OpenedToWebPopup;
      
      private var var_814:IAvatarRenderManager;
      
      private var var_190:IHabboToolbar;
      
      private var var_406:FriendListTabs;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _view:FriendListView;
      
      private var var_123:IHabboMessenger;
      
      private var var_1520:AvatarSearchResults;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_857:FriendRequests;
      
      private var var_1765:int;
      
      var var_15:FriendCategories;
      
      private var var_2043:FriendListLookAndFeel;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_856:IHabboNotifications;
      
      public function HabboFriendList(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_2043 = new FriendListLookAndFeel();
         super(param1,param2,param3);
         var_15 = new FriendCategories(new FriendCategoriesDeps(this));
         var_1520 = new AvatarSearchResults(new AvatarSearchDeps(this));
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationComponentInit);
      }
      
      private function onBuddyRequests(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:BuddyRequestsMessageParser = (param1 as BuddyRequestsEvent).getParser();
         var_857.clearAndUpdateView(false);
         for each(_loc3_ in _loc2_.reqs)
         {
            var_857.addRequest(new FriendRequest(_loc3_));
         }
         if(_loc2_.reqs.length > 0)
         {
            var_406.findTab(FriendListTab.const_89).setNewMessageArrived(true);
            refreshToolBarIcon();
         }
         _view.refresh("buddyRequests");
      }
      
      public function showLimitReachedAlert() : void
      {
         registerParameter("friendlist.listfull.text","mylimit","undefined");
         registerParameter("friendlist.listfull.text","clublimit","undefined");
         new SimpleAlertView(this,"${friendlist.listfull.title}","${friendlist.listfull.text}").show();
      }
      
      private function onFollowFriendFailed(param1:IMessageEvent) : void
      {
         var _loc2_:FollowFriendFailedMessageParser = (param1 as FollowFriendFailedEvent).getParser();
         var _loc3_:String = getFollowFriendErrorText(_loc2_.errorCode);
         Logger.log("Received follow friend failed: " + _loc2_.errorCode + ", " + _loc3_);
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      public function getButtonImage(param1:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_png");
         var _loc3_:BitmapDataAsset = _loc2_ as BitmapDataAsset;
         Logger.log("GETTING ASSET: " + param1);
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         Logger.log("GOT ASSET: " + _loc2_ + ", " + _loc4_);
         _loc5_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc5_.draw(_loc4_);
         return _loc5_;
      }
      
      public function getFriendNames() : Array
      {
         if(var_15 == null)
         {
            return [];
         }
         return var_15.getFriendNames();
      }
      
      public function get messenger() : IHabboMessenger
      {
         return var_123;
      }
      
      public function get categories() : FriendCategories
      {
         return var_15;
      }
      
      private function prepareButton(param1:IBitmapWrapperWindow, param2:String, param3:Function, param4:int) : void
      {
         param1.id = param4;
         if(param1.bitmap != null)
         {
            return;
         }
         param1.bitmap = getButtonImage(param2);
         param1.width = param1.bitmap.width;
         param1.height = param1.bitmap.height;
         param1.procedure = param3;
      }
      
      private function onMessengerInit(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         _view = new FriendListView(this);
         var _loc2_:MessengerInitMessageParser = (param1 as MessengerInitEvent).getParser();
         var_857 = new FriendRequests(new FriendRequestsDeps(this),_loc2_.userFriendLimit,_loc2_.extendedFriendLimit);
         for each(_loc3_ in _loc2_.categories)
         {
            var_15.addCategory(new FriendCategory(_loc3_.id,_loc3_.name));
         }
         var_15.addCategory(new FriendCategory(FriendCategory.const_951,getText("friendlist.friends")));
         var_15.addCategory(new FriendCategory(FriendCategory.const_480,getText("friendlist.friends.offlinecaption")));
         for each(_loc4_ in getSortedFriends(_loc2_.friends))
         {
            var_15.addFriend(new Friend(_loc4_));
         }
         var_406 = new FriendListTabs(new FriendListTabsDeps(this));
         if(!var_493)
         {
            var_493 = new Timer(120000);
            var_493.addEventListener(TimerEvent.TIMER,sendFriendListUpdate);
            var_493.start();
         }
         getBuddyRequests();
         registerListeners();
         var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_124,HabboToolbarIconEnum.FRIENDLIST));
         var_190.events.addEventListener(HabboToolbarEvent.const_59,onHabboToolbarEvent);
         Logger.log("FRIENDLIST INITIALIZED SUCCESSFULLY");
      }
      
      override public function dispose() : void
      {
         if(var_493)
         {
            var_493.stop();
            var_493.removeEventListener(TimerEvent.TIMER,sendFriendListUpdate);
            var_493 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(var_123)
         {
            var_123.release(new IIDHabboMessenger());
            var_123 = null;
         }
         if(var_155)
         {
            var_155.release(new IIDHabboConfigurationManager());
            var_155 = null;
         }
         if(_localization)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_814)
         {
            var_814.release(new IIDAvatarRenderManager());
            var_814 = null;
         }
         if(var_856)
         {
            var_856.release(new IIDHabboNotifications());
            var_856 = null;
         }
         if(var_190)
         {
            var_190.release(new IIDHabboToolbar());
            var_190 = null;
         }
         super.dispose();
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectMessageParser = (param1 as UserObjectEvent).getParser();
         var_1765 = int(_loc2_.id);
      }
      
      public function get searchResults() : AvatarSearchResults
      {
         return var_1520;
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : IBitmapWrapperWindow
      {
         var _loc7_:BitmapData = getButtonImage(param2);
         var _loc8_:IBitmapWrapperWindow = _windowManager.createWindow(param1,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_41,0 | 0,new Rectangle(param4,param5,_loc7_.width,_loc7_.height),param3,param6) as IBitmapWrapperWindow;
         _loc8_.bitmap = _loc7_;
         return _loc8_;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content));
      }
      
      private function onMessengerComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: messenger available " + [param1,param2]);
         var_123 = param2 as IHabboMessenger;
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderedReady);
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var_15.onFriendListUpdate(param1);
         _view.refresh("friendListUpdate");
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: window manager " + [param1,param2]);
         _windowManager = param2 as IHabboWindowManager;
         _communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(onAuthOK));
         _communication.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : void
      {
         _localization.registerParameter(param1,param2,param3);
      }
      
      private function onAuthOK(param1:IMessageEvent) : void
      {
         _communication.addHabboConnectionMessageEvent(new MessengerInitEvent(onMessengerInit));
         send(new MessengerInitMessageComposer());
      }
      
      private function onAcceptBuddyResult(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AcceptBuddyResultMessageParser = (param1 as AcceptBuddyResultEvent).getParser();
         for each(_loc3_ in _loc2_.failures)
         {
            friendRequests.acceptFailed(_loc3_.senderName);
         }
      }
      
      public function openFriendList() : void
      {
         if(_view == null)
         {
            Logger.log("Cannot open friendlist. Friendlist not initialized.");
            return;
         }
         _view.openFriendList();
         var _loc1_:FriendListTab = tabs.findTab(FriendListTab.const_88);
         if(_loc1_ != tabs.findSelectedTab())
         {
            tabs.toggleSelected(_loc1_);
            view.refresh("openFriendList");
         }
         _view.mainWindow.activate();
      }
      
      public function get avatarId() : int
      {
         return var_1765;
      }
      
      public function isEmbeddedMinimailEnabled() : Boolean
      {
         var _loc1_:String = var_155.getKey("client.minimail.embed.enabled");
         return _loc1_ == "true";
      }
      
      private function getSortedFriends(param1:Array) : Array
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Array = new Array();
         var _loc3_:Dictionary = new Dictionary();
         for each(_loc4_ in param1)
         {
            _loc2_.push(_loc4_.name.toLowerCase());
            _loc3_[_loc4_.name.toLowerCase()] = _loc4_;
         }
         _loc2_.sort();
         _loc5_ = new Array();
         for each(_loc6_ in _loc2_)
         {
            _loc5_.push(_loc3_[_loc6_]);
         }
         return _loc5_;
      }
      
      private function toggleWindow() : void
      {
         var _loc1_:* = null;
         if(_view.isFriendListOpen())
         {
            _view.close();
            trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED);
         }
         else
         {
            _view.openFriendList();
            _loc1_ = var_406.findSelectedTab();
            if(_loc1_ == null)
            {
               events.dispatchEvent(new Event(HabboFriendListTrackingEvent.const_312));
            }
            else
            {
               switch(_loc1_.id)
               {
                  case FriendListTab.const_88:
                     trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_FRIENDS);
                     break;
                  case FriendListTab.const_287:
                     trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_SEARCH);
                     break;
                  case FriendListTab.const_89:
                     trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_REQUEST);
               }
            }
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_190 = IHabboToolbar(param2) as IHabboToolbar;
         queueInterface(new IIDHabboNotifications(),onNotificationsReady);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: localization " + [param1,param2]);
         _localization = param2 as IHabboLocalizationManager;
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      private function onMessengerError(param1:IMessageEvent) : void
      {
         var _loc2_:MessengerErrorMessageParser = (param1 as MessengerErrorEvent).getParser();
         var _loc3_:String = "";
         switch(_loc2_.errorCode)
         {
            case 1:
               _loc3_ = "${friendlist.error.friendlistownlimit}";
               break;
            case 2:
               _loc3_ = "${friendlist.error.friendlistlimitofrequester}";
               break;
            case 3:
               _loc3_ = "${friendlist.error.friend_requests_disabled}";
               break;
            case 4:
               _loc3_ = "${friendlist.error.requestnotfound}";
               break;
            default:
               _loc3_ = "Received messenger error: msg: " + _loc2_.clientMessageId + ", errorCode: " + _loc2_.errorCode;
         }
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId != HabboToolbarIconEnum.FRIENDLIST)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_59)
         {
            toggleWindow();
         }
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_190;
      }
      
      private function onHabboSearchResult(param1:IMessageEvent) : void
      {
         var _loc2_:HabboSearchResultMessageParser = (param1 as HabboSearchResultEvent).getParser();
         var_1520.searchReceived(_loc2_.friends,_loc2_.others);
         _view.refresh("search");
      }
      
      public function get tabs() : FriendListTabs
      {
         return var_406;
      }
      
      public function get friendRequests() : FriendRequests
      {
         return var_857;
      }
      
      public function send(param1:IMessageComposer) : void
      {
         _communication.getHabboMainConnection(null).send(param1);
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: configuration " + [param1,param2]);
         var_155 = param2 as IHabboConfigurationManager;
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
      }
      
      public function get laf() : FriendListLookAndFeel
      {
         return var_2043;
      }
      
      public function refreshToolBarIcon() : void
      {
         var _loc1_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_171,HabboToolbarIconEnum.FRIENDLIST);
         _loc1_.iconState = String(var_857.getCountOfOpenRequests() > 0 ? "2" : "0");
         var_190.events.dispatchEvent(_loc1_);
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function canBeAskedForAFriend(param1:int) : Boolean
      {
         if(_view == null)
         {
            Logger.log("Cannot process canBeAskedForAFriend. Friendlist not initialized.");
            return false;
         }
         return this.getFriend(param1) == null && !searchResults.isFriendRequestSent(param1) && categories.getFriendCount(false) < friendRequests.limit;
      }
      
      public function getFriend(param1:int) : IFriend
      {
         if(_view == null)
         {
            Logger.log("Cannot process getFriend. Friendlist not initialized.");
            return null;
         }
         return var_15.findFriend(param1);
      }
      
      public function get view() : FriendListView
      {
         return _view;
      }
      
      public function refreshText(param1:IWindowContainer, param2:String, param3:Boolean, param4:String) : void
      {
         var _loc5_:ITextWindow = ITextWindow(param1.getChildByName(param2));
         if(!param3)
         {
            _loc5_.visible = false;
         }
         else
         {
            _loc5_.visible = true;
            _loc5_.text = param4;
         }
      }
      
      public function getText(param1:String) : String
      {
         return _localization.getKey(param1);
      }
      
      public function askForAFriend(param1:int, param2:String) : Boolean
      {
         if(_view == null)
         {
            Logger.log("Cannot ask for friend. Friendlist not initialized.");
            return false;
         }
         if(!canBeAskedForAFriend(param1))
         {
            return false;
         }
         send(new RequestBuddyMessageComposer(param2));
         searchResults.setFriendRequestSent(param1);
         return true;
      }
      
      private function getFollowFriendErrorText(param1:int) : String
      {
         if(param1 == 0)
         {
            return "${friendlist.followerror.notfriend}";
         }
         if(param1 == 1)
         {
            return "${friendlist.followerror.offline}";
         }
         if(param1 == 2)
         {
            return "${friendlist.followerror.hotelview}";
         }
         if(param1 == 3)
         {
            return "${friendlist.followerror.prevented}";
         }
         return "Unknown follow friend error " + param1;
      }
      
      public function declineFriendRequest(param1:int) : void
      {
         var _loc2_:FriendListTab = var_406.findTab(FriendListTab.const_89);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IFriendRequestsView = _loc2_.tabView as IFriendRequestsView;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.declineRequest(param1);
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: communication available " + [param1,param2]);
         _communication = param2 as IHabboCommunicationManager;
         queueInterface(new IIDHabboMessenger(),onMessengerComponentInit);
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:IAvatarImage = var_814.createAvatarImage(param1,AvatarScaleType.const_104);
         return _loc2_.getCroppedImage(AvatarSetType.const_47);
      }
      
      private function onNewBuddyRequest(param1:IMessageEvent) : void
      {
         Logger.log("Received new buddy request");
         var _loc2_:NewBuddyRequestMessageParser = (param1 as NewBuddyRequestEvent).getParser();
         var _loc3_:FriendRequest = new FriendRequest(_loc2_.req);
         var_857.addRequestAndUpdateView(_loc3_);
         var _loc4_:FriendListTab = var_406.findTab(FriendListTab.const_89);
         _loc4_.setNewMessageArrived(true);
         refreshToolBarIcon();
         _view.refresh("newBuddyRequest");
      }
      
      private function onRoomInviteError(param1:IMessageEvent) : void
      {
         var _loc2_:RoomInviteErrorMessageParser = (param1 as RoomInviteErrorEvent).getParser();
         var _loc3_:String = "Received room invite error: errorCode: " + _loc2_.errorCode + ", recipients: " + Util.arrayToString(_loc2_.failedRecipients);
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      private function onAvatarRenderedReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Messenger: avatar renderer " + [param1,param2]);
         var_814 = param2 as IAvatarRenderManager;
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
      }
      
      public function trackFriendListEvent(param1:String) : void
      {
         events.dispatchEvent(new Event(param1));
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_856 = param2 as IHabboNotifications;
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function getFriendCount(param1:Boolean, param2:Boolean) : int
      {
         if(_view == null)
         {
            Logger.log("Cannot get friend count. Friendlist not initialized.");
            return 0;
         }
         return this.var_15.getFriendCount(param1,param2);
      }
      
      private function registerListeners() : void
      {
         _communication.addHabboConnectionMessageEvent(new FollowFriendFailedEvent(onFollowFriendFailed));
         _communication.addHabboConnectionMessageEvent(new FriendListUpdateEvent(onFriendListUpdate));
         _communication.addHabboConnectionMessageEvent(new BuddyRequestsEvent(onBuddyRequests));
         _communication.addHabboConnectionMessageEvent(new NewBuddyRequestEvent(onNewBuddyRequest));
         _communication.addHabboConnectionMessageEvent(new AcceptBuddyResultEvent(onAcceptBuddyResult));
         _communication.addHabboConnectionMessageEvent(new MessengerErrorEvent(onMessengerError));
         _communication.addHabboConnectionMessageEvent(new HabboSearchResultEvent(onHabboSearchResult));
         _communication.addHabboConnectionMessageEvent(new RoomInviteErrorEvent(onRoomInviteError));
      }
      
      public function get notifications() : IHabboNotifications
      {
         return var_856;
      }
      
      public function refreshButton(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            prepareButton(_loc6_,param2,param4,param5);
            _loc6_.visible = true;
         }
      }
      
      private function getVariable(param1:String, param2:Dictionary) : String
      {
         return var_155.getKey(param1,param1,param2);
      }
      
      public function refreshIcon(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:IWindow = param1.findChildByName(param2);
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            _loc6_.id = param5;
            _loc6_.procedure = param4;
            _loc6_.visible = true;
         }
      }
      
      public function openHabboWebPage(param1:String, param2:Dictionary, param3:int, param4:int) : void
      {
         var linkAlias:String = param1;
         var params:Dictionary = param2;
         var x:int = param3;
         var y:int = param4;
         var url:String = getVariable(linkAlias,params);
         var webWindowName:String = "habboMain";
         try
         {
            HabboWebTools.navigateToURL(url,webWindowName);
         }
         catch(e:Error)
         {
            Logger.log("GOT ERROR: " + e);
         }
         if(var_1521 == null)
         {
            var_1521 = new OpenedToWebPopup(this);
         }
         var_1521.show(x,y);
      }
      
      public function acceptFriendRequest(param1:int) : void
      {
         var _loc2_:FriendListTab = var_406.findTab(FriendListTab.const_89);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IFriendRequestsView = _loc2_.tabView as IFriendRequestsView;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.acceptRequest(param1);
      }
      
      private function getBuddyRequests() : void
      {
         Logger.log("Sending buddy requests request");
         send(new GetBuddyRequestsMessageComposer());
      }
      
      protected function sendFriendListUpdate(param1:Event) : void
      {
         Logger.log("Sending update request");
         send(new FriendListUpdateMessageComposer());
      }
   }
}
