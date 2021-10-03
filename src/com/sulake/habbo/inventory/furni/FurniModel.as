package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestFurniInventoryComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestRoomPropertySet;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.items.WallItem;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.recycler.RecyclerModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FurniModel implements IInventoryModel
   {
      
      private static const const_1112:int = 100;
      
      public static const const_288:String = "pets";
      
      public static const const_43:String = "wall";
      
      public static const const_42:String = "floor";
       
      
      private var var_511:Timer;
      
      private var _view:FurniView;
      
      private var _disposed:Boolean = false;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_138:Timer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var var_2157:Boolean;
      
      private var var_722:IWindowContainer;
      
      private var var_902:Boolean;
      
      private var var_418:Map;
      
      private var var_13:HabboInventory;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _groupItemWindowBase:XML;
      
      private var var_1071:int = -1;
      
      public function FurniModel(param1:HabboInventory, param2:MarketplaceModel, param3:IHabboWindowManager, param4:IHabboCommunicationManager, param5:IAssetLibrary, param6:IRoomEngine, param7:IHabboLocalizationManager, param8:IHabboConfigurationManager)
      {
         super();
         var_13 = param1;
         _communication = param4;
         _windowManager = param3;
         _assets = param5;
         _roomEngine = param6;
         _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_220,onObjectPlaced);
         var_511 = new Timer(const_1112,1);
         var_511.addEventListener(TimerEvent.TIMER_COMPLETE,onImageUpdateTimerEvent);
         var _loc9_:IAsset = _assets.getAssetByName("inventory_thumb_xml");
         var _loc10_:XmlAsset = XmlAsset(_loc9_);
         _groupItemWindowBase = XML(_loc10_.content);
         clearFurniList();
         _view = new FurniView(this,param2,_windowManager,_assets,_roomEngine,param8);
         _view.switchCategory(const_42);
      }
      
      public function get isTradingOpen() : Boolean
      {
         return var_13.getSubCategoryViewId() == InventorySubCategory.const_241;
      }
      
      public function requestCurrentActionOnSelection() : void
      {
         if(isTradingOpen)
         {
            requestSelectedFurniToTrading();
         }
         else
         {
            requestSelectedFurniPlacement(false);
         }
      }
      
      public function addLockTo(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:Array = [const_42,const_43];
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc3_ = _loc6_[_loc7_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc8_] as GroupItem;
                  _loc4_.addLockTo(param1);
                  _loc8_++;
               }
            }
            _loc7_++;
         }
         _view.updateActionView();
      }
      
      public function getGroupItemInIndex(param1:int, param2:String = null) : GroupItem
      {
         if(param2 == null)
         {
            param2 = "null";
         }
         var _loc3_:Array = getCategoryContent(param2);
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1] as GroupItem;
      }
      
      public function updateView() : void
      {
         if(_view != null)
         {
            _view.updateActionView();
         }
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         return var_13.canUserOfferToTrade();
      }
      
      public function removeLockFrom(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:Array = [const_42,const_43];
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc3_ = _loc6_[_loc7_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc8_] as GroupItem;
                  if(_loc4_)
                  {
                     _loc4_.removeLockFrom(param1);
                  }
                  _loc8_++;
               }
            }
            _loc7_++;
         }
         _view.updateActionView();
      }
      
      public function getAllStripIds(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Array = var_418.getKeys();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = var_418.getValue(_loc2_[_loc3_]) as Array;
            if(_loc4_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc6_ = GroupItem(_loc4_[_loc5_]);
                  _loc7_ = _loc6_.getTotalCount();
                  if(_loc6_.category == FurniCategory.const_647)
                  {
                     _loc7_ = 1;
                  }
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_)
                  {
                     param1.push(GroupItem(_loc4_[_loc5_]).getAt(_loc8_).id);
                     _loc8_++;
                  }
                  _loc5_++;
               }
            }
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_13 = null;
            if(var_418 != null)
            {
               var_418.dispose();
               var_418 = null;
            }
            if(_view != null)
            {
               _view.dispose();
               _view = null;
            }
            if(_roomEngine != null)
            {
               if(false)
               {
                  _roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_220,onObjectPlaced);
               }
               _roomEngine = null;
            }
            _communication = null;
            _assets = null;
            _windowManager = null;
            if(var_511 != null)
            {
               var_511.removeEventListener(TimerEvent.TIMER_COMPLETE,onImageUpdateTimerEvent);
               var_511.stop();
               var_511 = null;
            }
            if(var_138 != null)
            {
               var_138.removeEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
               var_138.stop();
               var_138 = null;
            }
            if(var_722 != null)
            {
               var_722.dispose();
               var_722 = null;
            }
            _disposed = true;
         }
      }
      
      private function requestSelectedFurniToMover(param1:IItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(param1 is FloorItem)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = 0;
         }
         if(param1.category == FurniCategory.const_161)
         {
            _loc3_ = _roomEngine.initializeRoomObjectInsert(param1.id,_loc2_,param1.type,param1.stuffData);
         }
         else
         {
            _loc3_ = _roomEngine.initializeRoomObjectInsert(param1.id,_loc2_,param1.type,param1.extra.toString());
         }
         if(_loc3_)
         {
            var_1071 = param1.ref;
            if(!var_13.recyclerModel.running)
            {
               requestClose();
            }
            var_902 = true;
         }
         _view.updateActionView();
      }
      
      public function createNewGroupItemTemplate(param1:int, param2:String, param3:int, param4:String = null, param5:Number = NaN, param6:Boolean = false) : GroupItem
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param3 == FurniCategory.const_300)
         {
            _loc8_ = _assets.getAssetByName("icon_wallpaper_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_311)
         {
            _loc8_ = _assets.getAssetByName("icon_floor_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_324)
         {
            _loc8_ = _assets.getAssetByName("icon_landscape_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         var _loc10_:IAsset = _assets.getAssetByName("thumb_icon_recycle_png");
         if(_loc10_ != null)
         {
            _loc9_ = _loc10_.content as BitmapData;
         }
         if(var_722 == null)
         {
            var_722 = _windowManager.buildFromXML(_groupItemWindowBase) as IWindowContainer;
         }
         var _loc11_:IWindowContainer = var_722.clone() as IWindowContainer;
         return new GroupItem(param1,param2,param3,_loc11_,_roomEngine,_loc9_.clone(),var_13.recyclerModel.running,param4,param5,_loc7_,param6);
      }
      
      public function requestClose() : void
      {
         var_13.closeView();
      }
      
      public function removeAllLocks() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_42,const_43];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc6_];
            _loc1_ = getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc7_] as GroupItem;
                  if(_loc3_ != null)
                  {
                     _loc3_.removeAllLocks();
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         if(_view != null)
         {
            _view.updateActionView();
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function initTimeout(param1:TimerEvent) : void
      {
         if(var_138 != null)
         {
            var_138.removeEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
            var_138.stop();
            var_138 = null;
         }
         requestNewList();
      }
      
      public function requestSelectedFurniToTrading() : void
      {
         var _loc1_:GroupItem = getGroupItemInIndex(getSelectedItemIndex(),_view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IItem = _loc1_.getOneForTrade();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:TradingModel = var_13.tradingModel;
         if(_loc3_ != null)
         {
            _loc3_.requestAddItemToTrading(_loc2_.id,_loc2_.type,_loc2_.category,_loc2_.groupable,_loc2_.stuffData);
         }
         _view.updateActionView();
      }
      
      public function isListInited() : Boolean
      {
         return var_2157;
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         switch(param1)
         {
            case InventorySubCategory.const_241:
               cancelFurniInMover();
               if(_view != null)
               {
                  _view.updateActionView();
               }
               break;
            case InventorySubCategory.const_995:
               removeAllLocks();
               if(_view != null)
               {
                  _view.updateActionView();
               }
         }
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         if(param1 > 0)
         {
            if(var_138 != null)
            {
               var_138.removeEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
               var_138.stop();
               var_138 = null;
            }
            var_138 = new Timer(param1,1);
            var_138.addEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
            var_138.start();
         }
         else
         {
            requestNewList();
         }
      }
      
      public function addFurniAsLast(param1:IItem, param2:Boolean = false) : void
      {
         addFurniAt(param1,param2);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         var_13.checkCategoryInitilization(InventoryCategory.const_464);
         return _view.getWindowContainer();
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = getCategoryContent(param1);
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return;
         }
         if(_loc3_.length > param2)
         {
            _loc4_ = _loc3_[param2] as GroupItem;
            _loc4_.isSelected = true;
            _view.updateItem(param1,_loc4_,param2);
         }
         if(_loc4_ && _loc4_.isSelected)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if(_loc5_ != param2)
               {
                  _loc4_ = _loc3_[_loc5_] as GroupItem;
                  if(_loc4_ && _loc4_.isSelected)
                  {
                     _loc4_.isSelected = false;
                  }
               }
               _loc5_++;
            }
         }
         _view.updateActionView();
      }
      
      public function getGroupItemByType(param1:int) : GroupItem
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_42,const_43];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  if(_loc4_.type == param1)
                  {
                     return _loc4_;
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         return null;
      }
      
      public function requestNewList() : void
      {
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new RequestFurniInventoryComposer(0,0));
      }
      
      public function showRecyclable(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:Array = [const_42,const_43];
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc3_ = _loc6_[_loc7_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc8_] as GroupItem;
                  _loc4_.showRecyclable = param1;
                  _loc8_++;
               }
            }
            _loc7_++;
         }
         _view.updateActionView();
      }
      
      public function switchCategory(param1:String) : void
      {
         _view.switchCategory(param1);
      }
      
      public function requestSelectedFurniToRecycler() : IItem
      {
         var _loc1_:GroupItem = getGroupItemInIndex(getSelectedItemIndex(),_view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:IItem = _loc1_.getOneForRecycle();
         if(_loc2_ == null)
         {
            return null;
         }
         _view.updateActionView();
         return _loc2_;
      }
      
      public function cancelFurniInMover() : void
      {
         if(var_1071 > -1)
         {
            _roomEngine.cancelRoomObjectInsert();
            var_902 = false;
            var_1071 = -1;
            return;
         }
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_72 && false)
         {
            switch(_view.visibleCategoryId)
            {
               case const_42:
                  var_13.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_43:
                  var_13.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_288:
                  var_13.toggleInventoryPage(InventoryCategory.const_139);
            }
         }
      }
      
      private function onImageUpdateTimerEvent(param1:TimerEvent) : void
      {
         initListImages();
      }
      
      public function updatePostItCount(param1:int, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:Array = getCategoryContent(const_43);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_] as GroupItem;
            _loc6_ = _loc5_.getItem(param1) as WallItem;
            if(_loc6_ != null)
            {
               _loc6_.stuffData = String(param2);
               _loc5_.replaceItem(param1,_loc6_);
            }
            _loc4_++;
         }
      }
      
      public function requestSelectedFurniSelling() : void
      {
         var _loc1_:GroupItem = getGroupItemInIndex(getSelectedItemIndex(),_view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IItem = _loc1_.getOneForTrade();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketplaceModel = var_13.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.startOfferMaking(_loc2_);
      }
      
      public function updateLocks() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc10_:int = 0;
         var _loc1_:Array = new Array();
         var _loc2_:TradingModel = var_13.tradingModel;
         if(_loc2_ != null)
         {
            _loc1_ = _loc1_.concat(_loc2_.getOwnItemIdsInTrade());
         }
         var _loc3_:RecyclerModel = var_13.recyclerModel;
         if(_loc3_ != null)
         {
            _loc1_ = _loc1_.concat(_loc3_.getOwnItemsInRecycler());
         }
         if(_loc1_.length == 0)
         {
            removeAllLocks();
            return;
         }
         var _loc8_:Array = [const_42,const_43];
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc5_ = _loc8_[_loc9_];
            _loc4_ = getCategoryContent(_loc5_);
            if(_loc4_ != null)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc4_.length)
               {
                  _loc6_ = _loc4_[_loc10_] as GroupItem;
                  _loc6_.addLocksFromData(_loc1_);
                  _loc10_++;
               }
            }
            _loc9_++;
         }
         _view.updateActionView();
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(var_902 && param1.type == RoomEngineObjectEvent.const_220)
         {
            var_13.showView();
            var_902 = false;
         }
      }
      
      public function initListImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc4_:Array = [const_42,const_43];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            _loc1_ = getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc6_] as GroupItem;
                  if(!_loc3_.isImageInited)
                  {
                     _loc3_.initImage();
                     if(!_loc3_.isImageFinished)
                     {
                        var_511.reset();
                        var_511.start();
                        return;
                     }
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
      }
      
      public function removeFurni(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc7_:Array = [const_42,const_43];
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc3_ = _loc7_[_loc8_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc9_] as GroupItem;
                  _loc10_ = _loc4_.remove(param1);
                  if(_loc10_)
                  {
                     if(var_1071 == _loc10_.ref)
                     {
                        cancelFurniInMover();
                     }
                     if(_loc4_.getTotalCount() <= 0)
                     {
                        _view.removeItem(_loc3_,_loc9_);
                        _loc2_.splice(_loc9_,1);
                        if(_loc4_.isSelected)
                        {
                           toggleItemSelection(_loc3_,0);
                        }
                     }
                     else
                     {
                        _view.updateActionView();
                     }
                     return;
                  }
                  _loc9_++;
               }
            }
            _loc8_++;
         }
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function getSelectedItemIndex(param1:String = null) : int
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            if(_view == null)
            {
               return -1;
            }
         }
         if(param1 == null)
         {
            param1 = "null";
         }
         var _loc3_:Array = getCategoryContent(param1);
         if(_loc3_ == null)
         {
            return -1;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc5_] as GroupItem;
            if(_loc4_.isSelected)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      public function setListInited() : void
      {
         var_2157 = true;
      }
      
      public function furniCategorySwitch(param1:String) : void
      {
         if(false)
         {
            switch(_view.visibleCategoryId)
            {
               case const_42:
                  var_13.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_43:
                  var_13.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_288:
                  var_13.toggleInventoryPage(InventoryCategory.const_139);
            }
         }
      }
      
      public function requestSelectedFurniPlacement(param1:Boolean = false) : Boolean
      {
         var _loc2_:GroupItem = getGroupItemInIndex(getSelectedItemIndex(),_view.visibleCategoryId);
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.getUnlockedCount() == 0)
         {
            return false;
         }
         var _loc3_:IItem = _loc2_.peek();
         if(_loc3_ == null)
         {
            return false;
         }
         if(_loc3_.category == FurniCategory.const_311 || _loc3_.category == FurniCategory.const_300 || _loc3_.category == FurniCategory.const_324)
         {
            if(param1)
            {
               return false;
            }
            _communication.getHabboMainConnection(null).send(new RequestRoomPropertySet(_loc3_.id));
         }
         else
         {
            requestSelectedFurniToMover(_loc3_);
         }
         _view.updateActionView();
         return true;
      }
      
      public function displayItemInfo(param1:GroupItem) : void
      {
         if(_view && true)
         {
            _view.displayItemInfo(param1);
         }
      }
      
      public function getCategoryContent(param1:String) : Array
      {
         return var_418.getValue(param1);
      }
      
      public function clearFurniList() : void
      {
         var_418 = new Map();
         var_418.add(const_42,new Array());
         var_418.add(const_43,new Array());
         if(_view != null)
         {
            _view.clearViews();
         }
      }
      
      public function addFurniAt(param1:IItem, param2:Boolean = false, param3:int = -1) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 is FloorItem)
         {
            _loc4_ = const_42;
         }
         else
         {
            if(!(param1 is WallItem))
            {
               return;
            }
            _loc4_ = const_43;
         }
         var _loc6_:Array = getCategoryContent(_loc4_);
         if(!param1.groupable)
         {
            _loc5_ = createNewGroupItemTemplate(param1.type,_loc4_,param1.category,param1.stuffData,param1.extra,param2);
            _loc5_.push(param1);
            if(param3 == -1)
            {
               _loc6_.push(_loc5_);
            }
            else
            {
               _loc6_.splice(param3,0,_loc5_);
            }
            if(_view != null)
            {
               if(param3 == -1)
               {
                  _view.addItemToBottom(_loc4_,_loc5_);
               }
               else
               {
                  _view.addItemAt(_loc4_,_loc5_,param3);
               }
            }
         }
         else
         {
            _loc8_ = 0;
            for(; _loc8_ < _loc6_.length; _loc8_++)
            {
               _loc7_ = _loc6_[_loc8_] as GroupItem;
               if(_loc7_.type == param1.type)
               {
                  if(param1.category != FurniCategory.const_161)
                  {
                     _loc5_ = _loc7_;
                  }
                  if(_loc7_.stuffData == param1.stuffData)
                  {
                     _loc5_ = _loc7_;
                     break;
                  }
                  continue;
                  break;
               }
            }
            if(_loc5_)
            {
               _loc5_.push(param1);
            }
            else
            {
               _loc5_ = createNewGroupItemTemplate(param1.type,_loc4_,param1.category,param1.stuffData,param1.extra,param2);
               _loc5_.push(param1);
               if(_view != null)
               {
                  if(param3 == -1)
                  {
                     _loc6_.push(_loc5_);
                     _view.addItemToBottom(_loc4_,_loc5_);
                  }
                  else
                  {
                     _loc6_.unshift(_loc5_);
                     _view.addItemAt(_loc4_,_loc5_,param3);
                  }
               }
            }
         }
         if(_loc5_.isSelected)
         {
            _view.updateActionView();
         }
      }
   }
}
