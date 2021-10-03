package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomTagSearchMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class InfoStandUserView
   {
       
      
      private var _window:IItemListWindow;
      
      private var var_102:IItemListWindow;
      
      private var var_803:TagListRenderer;
      
      protected var var_60:IItemListWindow;
      
      private var var_216:IBorderWindow;
      
      protected var _widget:InfostandWidget;
      
      private var var_111:IBorderWindow;
      
      public function InfoStandUserView(param1:InfostandWidget, param2:String)
      {
         super();
         _widget = param1;
         createWindow(param2,false);
         var_803 = new TagListRenderer(param1,onTagSelected);
      }
      
      private function selectGroupBadge(param1:WindowMouseEvent) : void
      {
         if(_widget.userData.groupId < 0)
         {
            return;
         }
         var _loc2_:RoomWidgetGetBadgeDetailsMessage = new RoomWidgetGetBadgeDetailsMessage(_widget.userData.groupId);
         _widget.messageListener.processWidgetMessage(_loc2_);
      }
      
      protected function createWindow(param1:String, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc3_:XmlAsset = _widget.assets.getAssetByName("user_view") as XmlAsset;
         _window = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc3_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_216 = _window.getListItemByName("info_border") as IBorderWindow;
         var_60 = _window.getListItemByName("button_list") as IItemListWindow;
         var _loc4_:* = [];
         var_60.groupListItemsWithTag("CMD_BUTTON",_loc4_,true);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.parent)
            {
               _loc5_.parent.width = _loc5_.width;
            }
            _loc5_.addEventListener(WindowEvent.const_44,onButtonResized);
         }
         if(var_216 != null)
         {
            var_102 = var_216.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         var _loc6_:IBitmapWrapperWindow = var_216.findChildByName("home_icon") as IBitmapWrapperWindow;
         if(_loc6_ != null && !param2)
         {
            _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            _loc11_ = _widget.assets.getAssetByName("icon_home") as BitmapDataAsset;
            _loc12_ = _loc11_.content as BitmapData;
            _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            _loc6_.bitmap.copyPixels(_loc12_,_loc12_.rect,new Point(0,0));
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
         }
         _widget.mainContainer.addChild(_window);
         var _loc7_:IWindow = var_216.findChildByTag("close");
         if(_loc7_ != null)
         {
            _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClose);
         }
         if(var_60 != null)
         {
            _loc8_ = 0;
            while(_loc8_ < var_60.numListItems)
            {
               _loc13_ = var_60.getListItemAt(_loc8_) as IRegionWindow;
               if(_loc13_ != null)
               {
                  _loc9_ = _loc13_.getChildAt(0);
                  _loc9_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onButtonClicked);
               }
               _loc8_++;
            }
         }
         _loc8_ = 0;
         while(_loc8_ < 5)
         {
            _loc10_ = var_216.findChildByName("badge_" + _loc8_);
            if(_loc10_ != null)
            {
               _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,showBadgeInfo);
               _loc10_.addEventListener(WindowMouseEvent.const_29,hideBadgeInfo);
            }
            _loc8_++;
         }
         _loc10_ = var_216.findChildByName("badge_group");
         if(_loc10_ != null && !param2)
         {
            _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,selectGroupBadge);
         }
      }
      
      private function updateIgnoreButton(param1:Boolean) : void
      {
         showButton("ignore",!param1);
         showButton("unignore",param1);
      }
      
      private function showGroupBadgeInfo(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(_widget.userData.groupId < 0)
         {
            return;
         }
         createBadgeDetails();
         var _loc2_:IBitmapWrapperWindow = param1.window as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = var_111.getChildByName("name") as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.text = "Group Info";
         }
         _loc4_ = var_111.getChildByName("description") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.text = "Group Description";
         }
         var _loc5_:Rectangle = new Rectangle();
         _loc2_.getGlobalRectangle(_loc5_);
         var_111.x = _loc5_.left - 0;
         var_111.y = _loc5_.top + (_loc5_.height - 0) / 2;
      }
      
      public function clearGroupBadge() : void
      {
         var _loc1_:IWindowContainer = var_102.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = _loc1_.findChildByName("badge_group") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         }
      }
      
      public function set realName(param1:String) : void
      {
         var _loc2_:ITextWindow = var_102.getListItemByName("realname_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1.length == 0)
         {
            _loc2_.text = "";
         }
         else
         {
            _widget.localizations.registerParameter("infostand.text.realname","realname",param1);
            _loc2_.text = _widget.localizations.getKey("infostand.text.realname");
         }
         _loc2_.height = _loc2_.textHeight + 5;
         _loc2_.visible = param1.length > 0;
      }
      
      private function hideGroupBadgeInfo(param1:WindowMouseEvent) : void
      {
         disposeBadgeDetails();
      }
      
      public function setGroupBadgeImage(param1:BitmapData) : void
      {
         var _loc2_:IWindowContainer = var_102.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc3_:IBitmapWrapperWindow = _loc2_.findChildByName("badge_group") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         }
         copyToCenter(_loc3_.bitmap,param1);
         _loc3_.invalidate();
      }
      
      protected function updateInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         name = param1.name;
         motto = param1.motto;
         carryItem = param1.carryItem;
         xp = param1.xp;
         image = param1.image;
         realName = param1.realName;
      }
      
      protected function updateWindow() : void
      {
         if(var_102 == null || var_216 == null || var_60 == null)
         {
            return;
         }
         var_60.width = var_60.scrollableRegion.width;
         var_102.height = var_102.scrollableRegion.height;
         var_216.height = NaN;
         _window.width = Math.max(var_216.width,var_60.width);
         _window.height = _window.scrollableRegion.height;
         if(false)
         {
            var_216.x = 0 - 0;
            var_60.x = 0;
         }
         else
         {
            var_60.x = 0 - 0;
            var_216.x = 0;
         }
         _widget.refreshContainer();
      }
      
      public function set motto(param1:String) : void
      {
         var _loc2_:ITextWindow = var_102.getListItemByName("motto_text") as ITextWindow;
         var _loc3_:IWindowContainer = var_102.getListItemByName("motto_spacer") as IWindowContainer;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + 5;
         _loc2_.visible = param1 != "";
         _loc3_.visible = param1 != "";
         updateWindow();
      }
      
      public function setTags(param1:Array, param2:Array = null) : void
      {
         var _loc3_:IWindowContainer = var_102.getListItemByName("tags_container") as IWindowContainer;
         var _loc4_:IWindowContainer = var_102.getListItemByName("tags_spacer") as IWindowContainer;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         if(param1.length != 0)
         {
            _loc3_.height = var_803.renderTags(param1,_loc3_,param2);
            _loc4_.height = 1;
         }
         else
         {
            _loc3_.height = 0;
            _loc4_.height = 0;
         }
         updateWindow();
      }
      
      public function set carryItem(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:ITextWindow = var_102.getListItemByName("handitem_txt") as ITextWindow;
         var _loc3_:IWindowContainer = var_102.getListItemByName("handitem_spacer") as IWindowContainer;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         if(param1 > 0)
         {
            _loc4_ = _widget.localizations.getKey("handitem" + param1,"handitem" + param1);
            _widget.localizations.registerParameter("infostand.text.handitem","item",_loc4_);
         }
         _loc2_.height = _loc2_.textHeight + 5;
         _loc2_.visible = param1 > 0;
         _loc3_.visible = param1 > 0;
         updateWindow();
      }
      
      public function dispose() : void
      {
         _widget = null;
         _window.dispose();
         _window = null;
         var_803.dispose();
         var_803 = null;
         disposeBadgeDetails();
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:ITextWindow = var_102.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      protected function showButton(param1:String, param2:Boolean) : void
      {
         if(var_60 == null)
         {
            return;
         }
         var _loc3_:IWindow = var_60.getListItemByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            var_60.arrangeListItems();
         }
      }
      
      private function enableButton(param1:String, param2:Boolean = true) : void
      {
         if(var_60 == null)
         {
            return;
         }
         var _loc3_:IRegionWindow = var_60.getListItemByName(param1) as IRegionWindow;
         var _loc4_:IWindow = _loc3_.getChildAt(0);
         if(_loc4_ != null)
         {
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      protected function setButtonTooltip(param1:String, param2:String) : void
      {
         var _loc3_:IRegionWindow = var_60.getListItemByName(param1) as IRegionWindow;
         if(_loc3_ != null)
         {
            _loc3_.toolTipCaption = param2;
            _loc3_.toolTipDelay = 100;
         }
      }
      
      public function set image(param1:BitmapData) : void
      {
         var _loc2_:IWindowContainer = var_102.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc3_:IBitmapWrapperWindow = _loc2_.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.bitmap = param1;
         _loc3_.width = param1.width;
         _loc3_.height = param1.height;
         _loc3_.invalidate();
      }
      
      private function createBadgeDetails() : void
      {
         if(var_111 != null)
         {
            return;
         }
         var _loc1_:XmlAsset = _widget.assets.getAssetByName("badge_details") as XmlAsset;
         if(_loc1_ == null)
         {
            return;
         }
         var_111 = _widget.windowManager.buildFromXML(_loc1_.content as XML) as IBorderWindow;
         if(var_111 == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
      }
      
      private function copyToCenter(param1:BitmapData, param2:BitmapData) : void
      {
         param1.fillRect(param1.rect,0);
         var _loc3_:int = (param1.width - param2.width) / 2;
         var _loc4_:int = (param1.height - param2.height) / 2;
         param1.copyPixels(param2,param2.rect,new Point(_loc3_,_loc4_));
      }
      
      public function update(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         clearBadges();
         clearGroupBadge();
         setTags([]);
         updateInfo(param1);
         updateButtons(param1);
      }
      
      private function updateRespectButton() : void
      {
         if(var_60 == null)
         {
            return;
         }
         var _loc1_:IWindow = var_60.getListItemByName("respect");
         if(_loc1_ == null)
         {
            throw new Error("Respect button not found.");
         }
         var _loc2_:int = _widget.userData.respectLeft;
         _widget.localizations.registerParameter("infostand.button.respect","count",_loc2_.toString());
         _loc1_.visible = _loc2_ > 0;
         var_60.arrangeListItems();
      }
      
      protected function updateRightsButton(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            showButton("give_rights",!param2);
            showButton("remove_rights",param2);
         }
         else
         {
            showButton("give_rights",false);
            showButton("remove_rights",false);
         }
      }
      
      private function hideBadgeInfo(param1:WindowMouseEvent) : void
      {
         disposeBadgeDetails();
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         _widget.close();
      }
      
      public function clearBadges() : void
      {
         var _loc3_:* = null;
         var _loc1_:IWindowContainer = var_102.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = _loc1_.findChildByName("badge_" + _loc2_) as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            }
            _loc2_++;
         }
      }
      
      private function disposeBadgeDetails() : void
      {
         if(var_111 != null)
         {
            var_111.dispose();
            var_111 = null;
         }
      }
      
      protected function setTradeButtonTooltip(param1:int) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case RoomWidgetUserInfoUpdateEvent.TRADE_REASON_NO_OWN_RIGHT:
               _loc2_ = "${infostand.button.trade.tooltip.rights}";
               break;
            case RoomWidgetUserInfoUpdateEvent.const_918:
               _loc2_ = "${infostand.button.trade.tooltip.shutdown}";
               break;
            case RoomWidgetUserInfoUpdateEvent.const_858:
               _loc2_ = "${infostand.button.trade.tooltip.tradingroom}";
               break;
            default:
               _loc2_ = "";
         }
         setButtonTooltip("trade",_loc2_);
      }
      
      public function get window() : IItemListWindow
      {
         return _window;
      }
      
      private function showBadgeInfo(param1:WindowMouseEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:IBitmapWrapperWindow = param1.window as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = int(_loc2_.name.replace("badge_",""));
         if(_loc3_ < 0)
         {
            return;
         }
         var _loc4_:Array = _widget.userData.badges;
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc3_ >= _loc4_.length)
         {
            return;
         }
         var _loc5_:String = _widget.userData.badges[_loc3_];
         if(_loc5_ == null)
         {
            return;
         }
         createBadgeDetails();
         _loc6_ = var_111.getChildByName("name") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc6_.text = "${badge_name_" + _loc5_ + "}";
         }
         _loc6_ = var_111.getChildByName("description") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc6_.text = "${badge_desc_" + _loc5_ + "}";
         }
         var _loc7_:Rectangle = new Rectangle();
         _loc2_.getGlobalRectangle(_loc7_);
         var_111.x = _loc7_.left - 0;
         var_111.y = _loc7_.top + (_loc7_.height - 0) / 2;
      }
      
      protected function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:IWindow = param1.target as IWindow;
         switch(_loc4_.name)
         {
            case "whisper":
               _loc3_ = "null";
               break;
            case "friend":
               _loc4_.disable();
               _loc3_ = "null";
               break;
            case "respect":
               --_widget.userData.respectLeft;
               updateRespectButton();
               _loc3_ = "null";
               break;
            case "ignore":
               updateIgnoreButton(true);
               _loc3_ = "null";
               break;
            case "unignore":
               updateIgnoreButton(false);
               _loc3_ = "null";
               break;
            case "kick":
               _loc3_ = "null";
               break;
            case "ban":
               _loc3_ = "null";
               break;
            case "give_rights":
               updateRightsButton(true,true);
               _loc3_ = "null";
               break;
            case "remove_rights":
               updateRightsButton(true,false);
               _loc3_ = "null";
               break;
            case "trade":
               _loc3_ = "null";
               break;
            case "home_icon":
               _loc3_ = "null";
               break;
            case "report":
               _loc3_ = "null";
         }
         if(_loc3_ != null)
         {
            _loc5_ = _widget.userData.userId;
            _loc2_ = new RoomWidgetUserActionMessage(_loc3_,_loc5_);
            _widget.messageListener.processWidgetMessage(_loc2_);
         }
         updateWindow();
      }
      
      public function set xp(param1:int) : void
      {
         var _loc2_:ITextWindow = var_102.getListItemByName("xp_text") as ITextWindow;
         var _loc3_:IWindowContainer = var_102.getListItemByName("xp_spacer") as IWindowContainer;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         _widget.localizations.registerParameter("infostand.text.xp","xp",param1.toString());
         _loc2_.height = _loc2_.textHeight + 5;
         _loc2_.visible = param1 > 0;
         _loc3_.visible = param1 > 0;
         updateWindow();
      }
      
      protected function updateButtons(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:Boolean = false;
         if(var_60 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomWidgetUserInfoUpdateEvent.const_197:
               var_60.visible = false;
               break;
            case RoomWidgetUserInfoUpdateEvent.const_226:
               if(param1.isSpectatorMode)
               {
                  var_60.visible = false;
                  break;
               }
               enableButton("friend",true);
               showButton("friend",param1.canBeAskedAsFriend);
               updateRespectButton();
               updateIgnoreButton(param1.isIgnored);
               showButton("kick",(param1.amIOwner || param1.amIController || param1.amIAnyRoomController) && param1.canBeKicked);
               showButton("ban",(param1.amIOwner || param1.amIAnyRoomController) && param1.canBeKicked);
               updateRightsButton(param1.amIOwner,param1.hasFlatControl);
               enableButton("trade",param1.canTrade);
               setTradeButtonTooltip(param1.canTradeReason);
               _loc2_ = false;
               if(false && _widget.config.getKey("infostand.report.show","0") == "1")
               {
                  _loc2_ = true;
               }
               showButton("report",_loc2_);
               var_60.visible = true;
               break;
         }
         if(_window != null)
         {
            _window.arrangeListItems();
         }
         updateWindow();
      }
      
      public function method_7(param1:int, param2:BitmapData) : void
      {
         var _loc3_:IWindowContainer = var_102.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc4_:IBitmapWrapperWindow = _loc3_.findChildByName("badge_" + param1) as IBitmapWrapperWindow;
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.bitmap == null)
         {
            _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         }
         copyToCenter(_loc4_.bitmap,param2);
         _loc4_.invalidate();
      }
      
      private function onTagSelected(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _widget.messageListener.processWidgetMessage(new RoomWidgetRoomTagSearchMessage(_loc2_.text));
      }
      
      protected function onButtonResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.window.parent;
         if(_loc2_ && _loc2_.tags.indexOf("CMD_BUTTON_REGION") > -1)
         {
            _loc2_.width = param1.window.width;
         }
      }
   }
}
