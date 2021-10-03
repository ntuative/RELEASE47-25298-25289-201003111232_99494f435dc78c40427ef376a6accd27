package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPublicSpaceCastLibsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.UserCountRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tabs;
   import flash.display.BitmapData;
   
   public class OfficialRoomListCtrl implements IViewCtrl
   {
      
      private static const const_1041:int = 267;
      
      private static const const_1043:int = 65;
      
      private static const const_1042:int = -70;
       
      
      private var var_21:IWindowContainer;
      
      private var _navigator:HabboNavigator;
      
      private var var_778:UserCountRenderer;
      
      private var var_49:IItemListWindow;
      
      public function OfficialRoomListCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_778 = new UserCountRenderer(_navigator);
      }
      
      private function refreshGuestRoomImage(param1:IWindowContainer, param2:OfficialRoomEntryData, param3:IBitmapWrapperWindow) : void
      {
         var _loc4_:String = "guestRoom." + param2.guestRoomData.thumbnail.getAsString();
         if(param3.tags[0] == _loc4_)
         {
            param3.visible = true;
            return;
         }
         Logger.log("Redrawing guest room image");
         param3.x = 0;
         param3.width = 64;
         param3.bitmap = new BitmapData(64,64);
         this._navigator.thumbRenderer.refreshBitmapContent(param3.bitmap,param2.guestRoomData.thumbnail);
         param3.tags.splice(0,param3.tags.length);
         param3.tags.push(_loc4_);
         param3.visible = true;
      }
      
      private function setEnterArrowVisibility(param1:IWindow, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc3_:IWindowContainer = IWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IWindowContainer = IWindowContainer(_loc3_.findChildByName("enter_room"));
         if(_loc4_ == null)
         {
            return;
         }
         if(param2)
         {
            _navigator.refreshButton(_loc4_,"enter_room_l",true,null,0);
            _navigator.refreshButton(_loc4_,"enter_room_r",true,null,0);
            _loc5_ = IBitmapWrapperWindow(_loc4_.findChildByName("enter_room_m"));
            if(_loc5_.bitmap == null)
            {
               _loc5_.bitmap = _navigator.getButtonImage("enter_room_m");
            }
            _navigator.refreshButton(_loc4_,"enter_room_a",true,null,0);
         }
         _loc4_.visible = param2;
      }
      
      private function handleClick(param1:IWindow) : void
      {
         var _loc2_:OfficialRoomEntryData = this.getEntry(param1);
         if(_loc2_ == null)
         {
            return;
         }
         Logger.log("ENTRY CLICKED: " + _loc2_.picText + ", " + _loc2_.guestRoomData + ", " + _loc2_.publicRoomData + ", " + _loc2_.tag);
         if(_loc2_.guestRoomData != null)
         {
            Logger.log("ENTERING ROOM: " + _loc2_.guestRoomData.flatId);
            _navigator.goToRoom(_loc2_.guestRoomData.flatId,true);
         }
         else if(_loc2_.tag != null)
         {
            Logger.log("MAKING TAG SEARCH: " + _loc2_.tag);
            _navigator.mainViewCtrl.startSearch(Tabs.const_218,Tabs.const_310,_loc2_.tag);
         }
         else if(_loc2_.publicRoomData != null)
         {
            Logger.log("ENTERING PUBLIC SPACE: " + _loc2_.publicRoomData.nodeId);
            _navigator.send(new GetPublicSpaceCastLibsMessageComposer(_loc2_.publicRoomData.nodeId));
            _navigator.mainViewCtrl.close();
         }
         else
         {
            Logger.log("FOLDER CLICKD: " + _loc2_.index);
            _loc2_.toggleOpen();
            this._navigator.mainViewCtrl.refresh();
         }
      }
      
      private function refreshPublicSpaceImage(param1:IWindowContainer, param2:OfficialRoomEntryData, param3:IBitmapWrapperWindow) : void
      {
         var _loc4_:String = resolveRoomImageName(param2);
         var _loc5_:String = "publicSpace." + _loc4_ + "." + param2.showDetails;
         if(param3.tags[0] == _loc5_)
         {
            param3.visible = true;
            return;
         }
         param3.x = !!param2.showDetails ? int(const_1042) : 0;
         param3.width = 274;
         if(!_navigator.assets.hasAsset(_loc4_ + "_png"))
         {
            Logger.log("NA: " + _loc4_);
            param3.bitmap = new BitmapData(274,64,false,4291559424);
         }
         else
         {
            Logger.log("av: " + _loc4_);
            param3.bitmap = _navigator.getButtonImage(_loc4_);
         }
         param3.tags.splice(0,param3.tags.length);
         param3.tags.push(_loc5_);
         param3.visible = true;
      }
      
      private function refreshFolderEntry(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("folder_cont"));
         _loc3_.visible = true;
         var _loc4_:ITextWindow = ITextWindow(_loc3_.findChildByName("folder_name_text"));
         _loc4_.text = param2.popupCaption;
         _navigator.refreshButton(_loc3_,"arrow_down_white",param2.open,null,0);
         _navigator.refreshButton(_loc3_,"arrow_right_white",!param2.open,null,0);
         this.refreshFolderImage(_loc3_,param2);
         param1.height = 28;
      }
      
      private function refreshFolderImage(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("folder_image"));
         _loc3_.visible = false;
         if(param2.picRef != "")
         {
            refreshCustomImage(param2,_loc3_);
         }
      }
      
      private function getEntry(param1:IWindow) : OfficialRoomEntryData
      {
         var _loc2_:IWindowContainer = param1 as IWindowContainer;
         if(_loc2_ == null || _loc2_.name != "cont")
         {
            Logger.log("Target not cont");
            return null;
         }
         if(_navigator.data.officialRooms == null)
         {
            Logger.log("No official rooms data click");
            return null;
         }
         var _loc3_:int = _loc2_.id;
         Logger.log("Got index: " + _loc3_);
         var _loc4_:OfficialRoomEntryData = findEntry(_loc3_);
         if(_loc4_ == null)
         {
            Logger.log("No room found " + _loc3_ + ", " + _navigator.data.officialRooms.entries.length);
            return null;
         }
         return _loc4_;
      }
      
      private function onCell(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.setEnterArrowVisibility(param2,true);
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            this.setEnterArrowVisibility(param2,false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.handleClick(param2);
         }
      }
      
      private function refreshCustomImage(param1:OfficialRoomEntryData, param2:IBitmapWrapperWindow) : void
      {
         var _loc3_:String = "customImage." + param1.picRef;
         if(param2.tags[0] == _loc3_)
         {
            param2.visible = true;
            return;
         }
         Logger.log("Loading custom image: " + param1.picRef);
         param2.x = 0;
         param2.visible = false;
         var _loc4_:OfficialRoomImageLoader = new OfficialRoomImageLoader(_navigator,param1.picRef,param2);
         _loc4_.startLoad();
         param2.tags.splice(0,param2.tags.length);
         param2.tags.push(_loc3_);
      }
      
      private function findEntry(param1:int) : OfficialRoomEntryData
      {
         var _loc2_:* = null;
         for each(_loc2_ in _navigator.data.officialRooms.entries)
         {
            if(_loc2_.index == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function refreshEntryCaption(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:ITextWindow = ITextWindow(param1.getChildByName("entry_caption"));
         _loc3_.visible = true;
         _loc3_.text = getPopupCaption(param2);
      }
      
      private function refreshEntry(param1:Boolean, param2:int, param3:OfficialRoomEntryData) : Boolean
      {
         var _loc4_:IWindowContainer = IWindowContainer(var_49.getListItemAt(param2));
         var _loc5_:Boolean = false;
         if(_loc4_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc4_ = getListEntry(param2);
            var_49.addListItem(_loc4_);
            _loc5_ = true;
         }
         Util.hideChildren(_loc4_);
         if(param1)
         {
            _loc4_.id = param3.index;
            if(param3.type == OfficialRoomEntryData.const_1187)
            {
               refreshFolderEntry(_loc4_,param3);
            }
            else
            {
               refreshNormalEntry(_loc4_,param3);
            }
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.height = 0;
            _loc4_.visible = false;
         }
         return false;
      }
      
      private function refreshCell(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("image_cont"));
         _loc3_.visible = true;
         _loc3_.width = !!param2.showDetails ? int(const_1043) : int(const_1041);
         refreshPicText(_loc3_,param2);
         refreshRoomImage(_loc3_,param2);
      }
      
      public function dispose() : void
      {
         if(var_778)
         {
            var_778.dispose();
            var_778 = null;
         }
      }
      
      private function refreshEntryDesc(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:String = getPopupDesc(param2);
         if(_loc3_ == "")
         {
            return;
         }
         var _loc5_:ITextWindow = ITextWindow(param1.getChildByName("entry_desc"));
         _loc5_.text = _loc3_;
         _loc5_.visible = true;
      }
      
      private function refreshEmptyImage(param1:IWindowContainer, param2:OfficialRoomEntryData, param3:IBitmapWrapperWindow) : void
      {
         if(param3.tags[0] == "empty")
         {
            param3.visible = true;
            return;
         }
         Logger.log("Redrawing empty image");
         param3.x = 0;
         param3.width = 64;
         param3.bitmap = new BitmapData(64,64,false,4291611852);
         param3.tags.splice(0,param3.tags.length);
         param3.tags.push("empty");
         param3.visible = true;
      }
      
      public function refresh() : void
      {
         var _loc3_:Boolean = false;
         var _loc1_:Array = this.getVisibleEntries();
         var_49.autoArrangeItems = false;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < _loc1_.length)
            {
               refreshEntry(true,_loc2_,_loc1_[_loc2_]);
            }
            else
            {
               _loc3_ = refreshEntry(false,_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         var_49.autoArrangeItems = true;
      }
      
      public function getPopupCaption(param1:OfficialRoomEntryData) : String
      {
         if(param1.popupCaption != null && param1.popupCaption != "")
         {
            return param1.popupCaption;
         }
         if(param1.guestRoomData != null)
         {
            return param1.guestRoomData.roomName;
         }
         if(param1.publicRoomData != null)
         {
            return _navigator.getPublicSpaceName(param1.publicRoomData.unitPropertySet,param1.publicRoomData.worldId);
         }
         if(param1.tag != null && param1.tag != "")
         {
            return param1.tag;
         }
         return "NA";
      }
      
      private function refreshRoomImage(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("room_image"));
         _loc3_.visible = false;
         if(param2.picRef != "")
         {
            refreshCustomImage(param2,_loc3_);
         }
         else if(param2.publicRoomData != null)
         {
            refreshPublicSpaceImage(param1,param2,_loc3_);
         }
         else if(param2.guestRoomData != null)
         {
            refreshGuestRoomImage(param1,param2,_loc3_);
         }
         else
         {
            refreshEmptyImage(param1,param2,_loc3_);
         }
      }
      
      private function resolveRoomImageName(param1:OfficialRoomEntryData) : String
      {
         var _loc3_:* = null;
         var _loc2_:Array = param1.publicRoomData.castLibs.split(",");
         for each(_loc3_ in _loc2_)
         {
            if(_navigator.assets.hasAsset(_loc3_ + "_png"))
            {
               return _loc3_;
            }
         }
         return _loc2_[0];
      }
      
      private function refreshDetails(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("details_container"));
         _loc3_.visible = param2.showDetails;
         Logger.log("Refreshing details: " + _loc3_.visible);
         if(!param2.showDetails)
         {
            return;
         }
         Util.hideChildren(_loc3_);
         refreshEntryCaption(_loc3_,param2);
         refreshEntryDesc(_loc3_,param2);
         Logger.log("Refreshed: " + _loc3_.visible + ", " + _loc3_.rectangle);
      }
      
      private function refreshUserCount(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2.showDetails && (param2.type == OfficialRoomEntryData.const_682 || param2.type == OfficialRoomEntryData.const_590))
         {
            _loc3_ = 3;
            _loc4_ = 34;
            _loc5_ = 13;
            var_778.refreshUserCount(param2.maxUsers,param1,param2.userCount,"${navigator.usercounttooltip.users}",param1.width - _loc3_ - _loc4_,param1.height - _loc3_ - _loc5_);
         }
      }
      
      public function getPopupDesc(param1:OfficialRoomEntryData) : String
      {
         if(param1.popupCaption != null && param1.popupCaption != "")
         {
            return param1.popupDesc;
         }
         if(param1.guestRoomData != null)
         {
            return param1.guestRoomData.description;
         }
         if(param1.publicRoomData != null)
         {
            return _navigator.getPublicSpaceDesc(param1.publicRoomData.unitPropertySet,param1.publicRoomData.worldId);
         }
         return "";
      }
      
      private function getBgColor(param1:int) : uint
      {
         return param1 % 2 != 0 ? 4294967295 : uint(4292797682);
      }
      
      private function refreshNormalEntry(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         refreshCell(param1,param2);
         refreshDetails(param1,param2);
         refreshUserCount(param1,param2);
         param1.height = 68;
      }
      
      public function set content(param1:IWindowContainer) : void
      {
         var_21 = param1;
         var_49 = IItemListWindow(var_21.findChildByName("item_list"));
      }
      
      private function getVisibleEntries() : Array
      {
         var _loc4_:* = null;
         var _loc1_:Array = _navigator.data.officialRooms.entries;
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         for each(_loc4_ in _loc1_)
         {
            if(_loc4_.folderId > 0)
            {
               if(_loc4_.folderId == _loc3_)
               {
                  _loc2_.push(_loc4_);
               }
            }
            else
            {
               _loc3_ = !!_loc4_.open ? int(_loc4_.index) : 0;
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function get content() : IWindowContainer
      {
         return var_21;
      }
      
      private function refreshPicText(param1:IWindowContainer, param2:OfficialRoomEntryData) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.findChildByName("picTextContainer"));
         if(param2.picText == "" || param2.showDetails)
         {
            _loc3_.visible = false;
            return;
         }
         _loc3_.visible = true;
         var _loc5_:ITextWindow = ITextWindow(_loc3_.findChildByName("picText"));
         _loc5_.width = param1.width - 30;
         _loc5_.text = param2.picText;
         _loc5_.height = _loc5_.textHeight + 10;
         var _loc6_:* = _loc5_.textHeight > 10;
         var _loc7_:*;
         _loc3_.width = !!_loc6_ ? (_loc7_ = param1.width - 10, _loc3_.width = param1.width - 10, int(_loc7_)) : int(_loc5_.textWidth + 20);
         _loc3_.height = _loc5_.height + 4;
         _loc3_.x = param1.width - _loc3_.width - 5;
         _loc3_.y = param1.height - _loc3_.height - 5;
      }
      
      private function getListEntry(param1:int) : IWindowContainer
      {
         var _loc2_:IWindowContainer = IWindowContainer(_navigator.getXmlWindow("grs_official_room_row"));
         var _loc3_:IWindowContainer = IWindowContainer(_loc2_.findChildByName("image_cont"));
         var _loc4_:String = param1 % 2 == 0 ? "_b" : "";
         _navigator.refreshButton(_loc3_,"rico_rnd_l" + _loc4_,true,null,0);
         _navigator.refreshButton(_loc3_,"rico_rnd_r" + _loc4_,true,null,0);
         IBitmapWrapperWindow(_loc3_.findChildByName("rico_rnd_m")).bitmap = _navigator.getButtonImage("rico_rnd_m");
         _loc2_.procedure = onCell;
         _loc2_.color = getBgColor(param1);
         return _loc2_;
      }
   }
}
