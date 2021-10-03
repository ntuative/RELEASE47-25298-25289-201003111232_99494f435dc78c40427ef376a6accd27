package com.sulake.habbo.navigator
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.enum.HabboProtocolOption;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.navigator.domain.NavigatorData;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorOpenedEvent;
   import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailRenderer;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboNavigator extends Component implements IHabboNavigator
   {
       
      
      private var var_2363:Dictionary;
      
      private var var_155:IHabboConfigurationManager;
      
      private var _data:NavigatorData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_19:IRoomSessionManager;
      
      private var _doorbell:GuestRoomDoorbell;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_811:ISessionDataManager;
      
      private var var_810:RoomCreateViewCtrl;
      
      private var var_1892:RoomThumbnailRenderer;
      
      private var var_190:IHabboToolbar;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_565:RoomInfoViewCtrl;
      
      private var _catalog:IHabboCatalog;
      
      private var var_406:Tabs;
      
      private var var_260:MainViewCtrl;
      
      private var var_1893:Array;
      
      private var var_1089:GuestRoomPasswordInput;
      
      private var var_1045:IncomingMessages;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _friendList:IHabboFriendList;
      
      public function HabboNavigator(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1893 = new Array();
         super(param1,param2,param3);
         Logger.log("Navigator initialized");
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationComponentInit);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         _assetLibrary = new AssetLibraryCollection("NavigatorComponent");
         _data = new NavigatorData(this);
         var_260 = new MainViewCtrl(this);
         var_565 = new RoomInfoViewCtrl(this);
         var_810 = new RoomCreateViewCtrl(this);
         var_1892 = new RoomThumbnailRenderer(this);
         var_1089 = new GuestRoomPasswordInput(this);
         _doorbell = new GuestRoomDoorbell(this);
         var_406 = new Tabs(this);
      }
      
      public function performTagSearch(param1:String) : void
      {
         if(var_260 == null)
         {
            return;
         }
         var_260.startSearch(Tabs.const_218,Tabs.const_310,param1);
         var_260.mainWindow.activate();
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_190;
      }
      
      public function openCatalogClubPage() : void
      {
         if(_catalog == null)
         {
            return;
         }
         _catalog.openCatalogPage(CatalogPageName.const_258,true);
      }
      
      public function goToHomeRoom() : Boolean
      {
         if(this._data.settings.homeRoomId < 1)
         {
            Logger.log("No home room set while attempting to go to home room");
            return false;
         }
         this.goToRoom(this._data.settings.homeRoomId,true);
         return true;
      }
      
      public function get roomCreateViewCtrl() : RoomCreateViewCtrl
      {
         return var_810;
      }
      
      public function send(param1:IMessageComposer, param2:Boolean = false) : void
      {
         _communication.getHabboMainConnection(null).send(param1,!!param2 ? 0 : -1);
      }
      
      public function goToRoom(param1:int, param2:Boolean, param3:String = "") : void
      {
         Logger.log("GO TO ROOM: " + param1);
         if(var_19)
         {
            if(param2)
            {
               var_260.close();
            }
            var_565.close();
            var_19.gotoRoom(false,param1,param3);
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_85)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_59)
         {
            if(param1.iconId == HabboToolbarIconEnum.NAVIGATOR)
            {
               onNavigatorToolBarIconClick();
               return;
            }
            if(param1.iconId == HabboToolbarIconEnum.MEMENU)
            {
               this.roomInfoViewCtrl.close();
            }
            else if(param1.iconId == HabboToolbarIconEnum.ROOMINFO)
            {
               this.roomInfoViewCtrl.toggle();
            }
            else if(param1.iconId == HabboToolbarIconEnum.EXITROOM)
            {
               this.handleExitRoomClick();
            }
         }
      }
      
      public function get mainViewCtrl() : MainViewCtrl
      {
         return var_260;
      }
      
      public function getButtonImage(param1:String, param2:String = "_png") : BitmapData
      {
         var _loc7_:* = null;
         var _loc3_:String = param1 + param2;
         var _loc4_:IAsset = assets.getAssetByName(_loc3_);
         var _loc5_:BitmapDataAsset = BitmapDataAsset(_loc4_);
         var _loc6_:BitmapData = BitmapData(_loc5_.content);
         _loc7_ = new BitmapData(_loc6_.width,_loc6_.height,true,0);
         _loc7_.draw(_loc6_);
         return _loc7_;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _catalog = IHabboCatalog(param2) as IHabboCatalog;
      }
      
      public function goToPublicSpace(param1:int, param2:String) : void
      {
         Logger.log("GO TO PUBLIC SPACE: " + param1);
         if(var_19)
         {
            var_565.close();
            var_19.gotoRoom(true,param1,"",param2);
         }
      }
      
      public function animateWindowOpen(param1:IWindowContainer) : void
      {
         if(param1 != null && var_190 != null)
         {
            var_190.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.NAVIGATOR,param1));
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_260)
         {
            var_260.dispose();
            var_260 = null;
         }
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(var_19)
         {
            var_19.release(new IIDHabboRoomSessionManager());
            var_19 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_localization)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_155)
         {
            var_155.release(new IIDHabboConfigurationManager());
            var_155 = null;
         }
         if(_friendList)
         {
            _friendList.release(new IIDHabboFriendList());
            _friendList = null;
         }
         if(var_811)
         {
            var_811.release(new IIDSessionDataManager());
            var_811 = null;
         }
         if(_catalog)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(var_190)
         {
            var_190.release(new IIDHabboToolbar());
            var_190 = null;
         }
         if(var_565)
         {
            var_565.dispose();
            var_565 = null;
         }
         if(var_810)
         {
            var_810.dispose();
            var_810 = null;
         }
         super.dispose();
      }
      
      public function getText(param1:String) : String
      {
         var _loc2_:String = _localization.getKey(param1);
         if(_loc2_ == null || _loc2_ == "")
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc4_:int = 0;
         Logger.log("Navigator: configuration " + [param1,param2]);
         var_155 = param2 as IHabboConfigurationManager;
         var _loc3_:String = var_155.getKey("navigator.default_tab");
         switch(_loc3_)
         {
            case "popular":
               _loc4_ = 0;
               break;
            case "official":
               _loc4_ = 0;
               break;
            case "me":
               _loc4_ = 0;
               break;
            case "events":
            default:
               _loc4_ = 0;
         }
         tabs.setSelectedTab(_loc4_);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_190 != null)
         {
            var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_124,HabboToolbarIconEnum.NAVIGATOR));
            if(this._data != null && this._data.settings != null && this._data.settings.homeRoomId > 0)
            {
               var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_124,HabboToolbarIconEnum.EXITROOM));
            }
         }
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : IBitmapWrapperWindow
      {
         var _loc7_:BitmapData = getButtonImage(param2);
         var _loc8_:IBitmapWrapperWindow = IBitmapWrapperWindow(_windowManager.createWindow(param1,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_41,0 | 0,new Rectangle(param4,param5,_loc7_.width,_loc7_.height),param3,param6));
         _loc8_.bitmap = _loc7_;
         return _loc8_;
      }
      
      public function get data() : NavigatorData
      {
         return _data;
      }
      
      public function get assetLibrary() : IAssetLibrary
      {
         return _assetLibrary;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_190 = IHabboToolbar(param2) as IHabboToolbar;
         var_190.events.addEventListener(HabboToolbarEvent.const_85,onHabboToolbarEvent);
         var_190.events.addEventListener(HabboToolbarEvent.const_59,onHabboToolbarEvent);
         setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_811 = param2 as ISessionDataManager;
      }
      
      public function get doorbell() : GuestRoomDoorbell
      {
         return _doorbell;
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Navigator: communication available " + [param1,param2]);
         _communication = IHabboCommunicationManager(param2);
         var_1045 = new IncomingMessages(this);
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content));
      }
      
      public function get thumbRenderer() : RoomThumbnailRenderer
      {
         return var_1892;
      }
      
      private function prepareButton(param1:IBitmapWrapperWindow, param2:String, param3:Function, param4:int) : void
      {
         param1.id = param4;
         param1.procedure = param3;
         if(param1.bitmap != null)
         {
            return;
         }
         param1.bitmap = getButtonImage(param2);
         param1.width = param1.bitmap.width;
         param1.height = param1.bitmap.height;
      }
      
      public function showOwnRooms() : void
      {
         if(var_260 == null)
         {
            return;
         }
         var_260.startSearch(Tabs.const_271,Tabs.const_199);
         var_406.getTab(Tabs.const_271).tabPageDecorator.tabSelected();
      }
      
      private function handleExitRoomClick() : void
      {
         Logger.log("Got exit room");
         if(this._data.settings.homeRoomId < 1)
         {
            Logger.log("No home room defined. Go to hotel view");
            this.send(new QuitMessageComposer());
            return;
         }
         if(_data.isCurrentRoomHome())
         {
            Logger.log("Already in home room. Go to hotel view");
            this.send(new QuitMessageComposer());
            return;
         }
         Logger.log("Going to home room");
         goToHomeRoom();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : void
      {
         _localization.registerParameter(param1,param2,param3);
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Navigator: friendlist " + [param1,param2]);
         _friendList = IHabboFriendList(param2);
      }
      
      public function getPublicSpaceName(param1:String, param2:int) : String
      {
         var _loc3_:* = "nav_venue_" + param1 + "/" + param2 + "_name";
         var _loc4_:String = getText(_loc3_);
         if(_loc4_ != _loc3_)
         {
            return _loc4_;
         }
         return getText("nav_venue_" + param1 + "_name");
      }
      
      private function onNavigatorToolBarIconClick() : void
      {
         var _loc1_:Boolean = var_260.onNavigatorToolBarIconClick();
         if(_loc1_)
         {
            events.dispatchEvent(new HabboNavigatorOpenedEvent());
         }
      }
      
      public function get friendList() : IHabboFriendList
      {
         return _friendList;
      }
      
      public function getPublicSpaceDesc(param1:String, param2:int) : String
      {
         return getText("nav_venue_" + param1 + "/" + param2 + "_desc");
      }
      
      public function onAuthOk() : void
      {
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return _communication;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return var_811;
      }
      
      public function get roomSettingsCtrls() : Array
      {
         return var_1893;
      }
      
      public function refreshButton(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int, param6:String = null) : void
      {
         if(!param6)
         {
            param6 = param2;
         }
         var _loc7_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(!param3)
         {
            _loc7_.visible = false;
         }
         else
         {
            prepareButton(_loc7_,param6,param4,param5);
            _loc7_.visible = true;
         }
      }
      
      public function get passwordInput() : GuestRoomPasswordInput
      {
         return var_1089;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_19 = IRoomSessionManager(param2);
      }
      
      public function get roomInfoViewCtrl() : RoomInfoViewCtrl
      {
         return var_565;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Navigator: localization " + [param1,param2]);
         _localization = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_155;
      }
      
      public function get tabs() : Tabs
      {
         return var_406;
      }
   }
}
