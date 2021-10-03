package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_697:IWindowContainer;
      
      private var var_1031:ITextWindow;
      
      private var var_194:RoomSettingsCtrl;
      
      private var var_1257:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1253:ITextWindow;
      
      private var var_351:IWindowContainer;
      
      private var var_2019:IWindowContainer;
      
      private var var_2018:ITextWindow;
      
      private var var_848:IWindowContainer;
      
      private var var_1508:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_668:ITextWindow;
      
      private var var_1507:IWindowContainer;
      
      private var var_1255:IWindowContainer;
      
      private var var_846:ITextWindow;
      
      private var var_1033:ITextFieldWindow;
      
      private var var_307:IWindowContainer;
      
      private var var_847:ITextWindow;
      
      private var var_1504:IButtonWindow;
      
      private var var_1032:ITextWindow;
      
      private var var_2311:int;
      
      private var var_1251:IContainerButtonWindow;
      
      private var var_845:IWindowContainer;
      
      private var var_1254:ITextWindow;
      
      private var var_1252:IContainerButtonWindow;
      
      private var var_1506:ITextWindow;
      
      private var var_1505:IButtonWindow;
      
      private var var_803:TagRenderer;
      
      private var var_2016:ITextWindow;
      
      private var var_352:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_696:ITextWindow;
      
      private var var_268:RoomThumbnailCtrl;
      
      private var var_1256:IContainerButtonWindow;
      
      private var var_2017:IWindowContainer;
      
      private var var_269:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_352 = new RoomEventViewCtrl(_navigator);
         var_194 = new RoomSettingsCtrl(_navigator,this,true);
         var_268 = new RoomThumbnailCtrl(_navigator);
         var_803 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_194);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_194.active = true;
         this.var_352.active = false;
         this.var_268.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1508.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1505.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1507.visible = Util.hasVisibleChildren(var_1507);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_668.text = param1.roomName;
         var_668.height = NaN;
         _ownerName.text = param1.ownerName;
         var_846.text = param1.description;
         var_803.refreshTags(var_351,param1.tags);
         var_846.visible = false;
         if(param1.description != "")
         {
            var_846.height = NaN;
            var_846.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_351,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_351,"thumb_down",_loc3_,onThumbDown,0);
         var_2018.visible = _loc3_;
         var_847.visible = !_loc3_;
         var_1506.visible = !_loc3_;
         var_1506.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_351,"home",param2,null,0);
         _navigator.refreshButton(var_351,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_351,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_668.y,0);
         var_351.visible = true;
         var_351.height = Util.getLowestPoint(var_351);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_380,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1504.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1257.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1256.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1251.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1252.visible = _navigator.data.canEditRoomSettings && param1;
         var_1255.visible = Util.hasVisibleChildren(var_1255);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_352.active = false;
         this.var_194.active = false;
         this.var_268.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_352.active = false;
         this.var_194.active = false;
         this.var_268.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_380,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_307);
         var_307.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_194.refresh(var_307);
         this.var_268.refresh(var_307);
         Util.moveChildrenToColumn(var_307,["room_details","room_buttons"],0,2);
         var_307.height = Util.getLowestPoint(var_307);
         var_307.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1033.setSelection(0,var_1033.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_269);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_352.refresh(var_269);
         if(Util.hasVisibleChildren(var_269) && !this.var_268.active)
         {
            Util.moveChildrenToColumn(var_269,["event_details","event_buttons"],0,2);
            var_269.height = Util.getLowestPoint(var_269);
            var_269.visible = true;
         }
         else
         {
            var_269.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_352.active = true;
         this.var_194.active = false;
         this.var_268.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1031.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1031.height = NaN;
         var_1253.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1253.height = NaN;
         Util.moveChildrenToColumn(var_697,["public_space_name","public_space_desc"],var_1031.y,0);
         var_697.visible = true;
         var_697.height = Math.max(86,Util.getLowestPoint(var_697));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_845.visible = true;
            var_1033.text = this.getEmbedData();
         }
         else
         {
            var_845.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_194.load(param1);
         this.var_194.active = true;
         this.var_352.active = false;
         this.var_268.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_194.active = false;
         this.var_352.active = false;
         this.var_268.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_67,false);
         _window.setParamFlag(HabboWindowParam.const_1347,true);
         _window.visible = false;
         var_307 = IWindowContainer(find("room_info"));
         var_351 = IWindowContainer(find("room_details"));
         var_697 = IWindowContainer(find("public_space_details"));
         var_2017 = IWindowContainer(find("owner_name_cont"));
         var_2019 = IWindowContainer(find("rating_cont"));
         var_1255 = IWindowContainer(find("room_buttons"));
         var_668 = ITextWindow(find("room_name"));
         var_1031 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_846 = ITextWindow(find("room_desc"));
         var_1253 = ITextWindow(find("public_space_desc"));
         var_1032 = ITextWindow(find("owner_caption"));
         var_847 = ITextWindow(find("rating_caption"));
         var_2018 = ITextWindow(find("rate_caption"));
         var_1506 = ITextWindow(find("rating_txt"));
         var_269 = IWindowContainer(find("event_info"));
         var_848 = IWindowContainer(find("event_details"));
         var_1507 = IWindowContainer(find("event_buttons"));
         var_2016 = ITextWindow(find("event_name"));
         var_696 = ITextWindow(find("event_desc"));
         var_1257 = IContainerButtonWindow(find("add_favourite_button"));
         var_1256 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1251 = IContainerButtonWindow(find("make_home_button"));
         var_1252 = IContainerButtonWindow(find("unmake_home_button"));
         var_1504 = IButtonWindow(find("room_settings_button"));
         var_1508 = IButtonWindow(find("create_event_button"));
         var_1505 = IButtonWindow(find("edit_event_button"));
         var_845 = IWindowContainer(find("embed_info"));
         var_1254 = ITextWindow(find("embed_info_txt"));
         var_1033 = ITextFieldWindow(find("embed_src_txt"));
         Util.method_2(var_1257,onAddFavouriteClick);
         Util.method_2(var_1256,onRemoveFavouriteClick);
         Util.method_2(var_1504,onRoomSettingsClick);
         Util.method_2(var_1251,onMakeHomeClick);
         Util.method_2(var_1252,onUnmakeHomeClick);
         Util.method_2(var_1508,onEventSettingsClick);
         Util.method_2(var_1505,onEventSettingsClick);
         Util.method_2(var_1033,onEmbedSrcClick);
         _navigator.refreshButton(var_1257,"favourite",true,null,0);
         _navigator.refreshButton(var_1256,"favourite",true,null,0);
         _navigator.refreshButton(var_1251,"home",true,null,0);
         _navigator.refreshButton(var_1252,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.method_2(var_307,onHover);
         Util.method_2(var_269,onHover);
         var_1032.width = var_1032.textWidth;
         Util.moveChildrenToRow(var_2017,["owner_caption","owner_name"],var_1032.x,var_1032.y,3);
         var_847.width = var_847.textWidth;
         Util.moveChildrenToRow(var_2019,["rating_caption","rating_txt"],var_847.x,var_847.y,3);
         var_1254.height = NaN;
         Util.moveChildrenToColumn(var_845,["embed_info_txt","embed_src_txt"],var_1254.y,2);
         var_845.height = Util.getLowestPoint(var_845) + 5;
         var_2311 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2016.text = param1.eventName;
         var_696.text = param1.eventDescription;
         var_803.refreshTags(var_848,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_696.visible = false;
         if(param1.eventDescription != "")
         {
            var_696.height = NaN;
            var_696.y = Util.getLowestPoint(var_848) + 2;
            var_696.visible = true;
         }
         var_848.visible = true;
         var_848.height = Util.getLowestPoint(var_848);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_878,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
