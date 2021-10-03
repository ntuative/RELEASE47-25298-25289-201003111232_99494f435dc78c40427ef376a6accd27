package com.sulake.habbo.inventory.recycler
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class RecyclerModel implements IInventoryModel
   {
      
      public static const STATE_ACTIVE:uint = 1;
      
      public static const STATE_READY:uint = 0;
       
      
      private var var_584:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_35:uint = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_10:HabboInventory;
      
      private var _itemList:Map;
      
      private var _localization:IHabboLocalizationManager;
      
      public function RecyclerModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager)
      {
         super();
         var_10 = param1;
         _communication = param3;
         _assetLibrary = param4;
         _roomEngine = param5;
         _localization = param6;
      }
      
      public function startRecycler() : void
      {
         var_35 = STATE_ACTIVE;
         _itemList = new Map();
         var_10.furniModel.showRecyclable(true);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return null;
      }
      
      public function get running() : Boolean
      {
         return var_35 == STATE_ACTIVE;
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
      }
      
      public function lockSelectedFurni() : int
      {
         if(_itemList == null)
         {
            return 0;
         }
         var _loc1_:IItem = var_10.furniModel.requestSelectedFurniToRecycler();
         if(_loc1_ == null)
         {
            return 0;
         }
         if(_itemList.getValue(_loc1_.id) == null)
         {
            _itemList.add(_loc1_.id,_loc1_);
         }
         return _loc1_.id;
      }
      
      public function get state() : uint
      {
         return var_35;
      }
      
      public function getFurniInventoryModel() : FurniModel
      {
         return var_10.furniModel;
      }
      
      public function categorySwitch(param1:String) : void
      {
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_10 = null;
            _communication = null;
            _assetLibrary = null;
            _roomEngine = null;
            _localization = null;
            _disposed = true;
         }
         stopRecycler();
      }
      
      public function stopRecycler() : void
      {
         var _loc2_:int = 0;
         var_35 = STATE_READY;
         if(var_10 != null && false)
         {
            var_10.furniModel.showRecyclable(false);
         }
         else
         {
            _itemList = null;
         }
         if(_itemList == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < _itemList.length)
         {
            _loc2_ = _itemList.getKey(_loc1_);
            var_10.furniModel.removeLockFrom(_loc2_);
            _loc1_++;
         }
         _itemList = null;
      }
      
      public function set state(param1:uint) : void
      {
         var_35 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function getOwnItemsInRecycler() : Array
      {
         var _loc1_:Array = new Array();
         if(_itemList == null)
         {
            return [];
         }
         var _loc2_:int = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_.push(_itemList.getKey(_loc2_));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function releaseFurni(param1:int) : Boolean
      {
         if(_itemList == null)
         {
            return true;
         }
         var _loc2_:IItem = _itemList.getValue(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         var_10.furniModel.removeLockFrom(param1);
         _itemList.remove(param1);
         return true;
      }
   }
}
