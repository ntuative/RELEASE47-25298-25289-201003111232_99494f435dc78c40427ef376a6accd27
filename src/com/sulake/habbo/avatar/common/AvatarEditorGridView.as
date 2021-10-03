package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITabSelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class AvatarEditorGridView
   {
       
      
      private var _view:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private const const_1622:int = 3;
      
      private var _category:String;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_426:IItemGridWindow;
      
      private var var_738:IItemGridWindow;
      
      private var _model:IAvatarEditorCategoryModel;
      
      private var var_891:Boolean = true;
      
      public function AvatarEditorGridView(param1:IAvatarEditorCategoryModel, param2:String, param3:IHabboWindowManager, param4:IAssetLibrary)
      {
         super();
         _model = param1;
         _category = param2;
         _assetLibrary = param4;
         _windowManager = param3;
         var _loc5_:XmlAsset = _assetLibrary.getAssetByName("AvatarEditorGrid") as XmlAsset;
         _view = IWindowContainer(_windowManager.buildFromXML(_loc5_.content as XML));
         if(_view != null)
         {
            var_426 = _view.findChildByName("thumbs") as IItemGridWindow;
            var_738 = _view.findChildByName("colors") as IItemGridWindow;
         }
      }
      
      public function updateItem(param1:int, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = var_426.getGridItemAt(param1);
         if(_loc3_)
         {
            _loc3_ = param2;
         }
      }
      
      private function paletteEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_49)
         {
            _loc3_ = var_738.getGridItemIndex(param1.window);
            _model.toggleColorSelection(_category,_loc3_);
         }
      }
      
      public function initFromList() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:CategoryData = _model.getCategoryContent(_category);
         for each(_loc2_ in _loc1_.data)
         {
            var_426.addGridItem(_loc2_.view);
            _loc2_.view.procedure = itemEventProc;
            if(_loc2_.isSelected)
            {
               showColorLayerTabs(_loc2_.colorLayerCount);
            }
         }
         for each(_loc3_ in _loc1_.palette)
         {
            var_738.addGridItem(_loc3_.view);
            _loc3_.view.procedure = paletteEventProc;
         }
         _loc4_ = _view.findChildByName("colorTabs") as ITabSelectorWindow;
         if(_loc4_)
         {
            _loc4_.procedure = tabsEventProc;
         }
         selectColorLayerTab(0);
         var_891 = false;
      }
      
      public function dispose() : void
      {
         if(var_426 != null)
         {
            var_426.dispose();
            var_426 = null;
         }
         if(var_738 != null)
         {
            var_738.dispose();
            var_738 = null;
         }
         _model = null;
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
         _windowManager = null;
         _assetLibrary = null;
      }
      
      public function selectColorLayerTab(param1:int) : void
      {
         var _loc2_:ITabSelectorWindow = _view.findChildByName("colorTabs") as ITabSelectorWindow;
         if(_loc2_)
         {
            _loc2_.setSelected(_loc2_.getSelectableByName("colorLayerIndex" + param1));
         }
      }
      
      public function get window() : IWindowContainer
      {
         if(_view == null)
         {
            return null;
         }
         if(false)
         {
            return null;
         }
         return _view;
      }
      
      public function clearGrid() : void
      {
         if(var_426 != null)
         {
            var_426.removeGridItems();
         }
      }
      
      public function get firstView() : Boolean
      {
         return var_891;
      }
      
      public function showColorLayerTabs(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = param1;
         if(param1 <= 1)
         {
            _loc2_ = 0;
         }
         var _loc4_:int = 0;
         while(_loc4_ < const_1622)
         {
            _loc3_ = _view.findChildByName("colorLayerIndex" + _loc4_) as IWindow;
            if(_loc3_)
            {
               _loc3_.visible = _loc4_ < _loc2_;
            }
            _loc4_++;
         }
      }
      
      private function tabsEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowEvent.const_53)
         {
            if(param2.name.indexOf("colorLayerIndex") == 0)
            {
               _loc3_ = int(param2.name.substr(15));
               _model.toggleColorLayerSelection(_category,_loc3_);
            }
         }
      }
      
      private function itemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_49)
         {
            _loc3_ = var_426.getGridItemIndex(param1.window);
            _model.toggleItemSelection(_category,_loc3_);
         }
      }
   }
}
