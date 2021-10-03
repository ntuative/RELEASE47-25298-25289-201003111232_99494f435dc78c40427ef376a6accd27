package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.utils.IIterator;
   import flash.geom.Rectangle;
   
   public class ScrollableItemListWindow extends WindowController implements IScrollableListWindow
   {
       
      
      private var var_782:IItemListWindow;
      
      private var var_334:IScrollbarWindow;
      
      private var var_1421:Boolean = true;
      
      public function ScrollableItemListWindow(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         _scrollBar.scrollable = _itemList;
         if(_scrollBar.testStateFlag(WindowState.const_69))
         {
            hideScrollBar();
         }
      }
      
      public function groupListItemsWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         return _itemList.groupListItemsWithTag(param1,param2,param3);
      }
      
      public function set scrollStepV(param1:Number) : void
      {
         _itemList.scrollStepV = param1;
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return _itemList.scrollableRegion;
      }
      
      public function removeListItem(param1:IWindow) : IWindow
      {
         return _itemList.removeListItem(param1);
      }
      
      public function arrangeListItems() : void
      {
         _itemList.arrangeListItems();
      }
      
      public function get visibleRegion() : Rectangle
      {
         return _itemList.visibleRegion;
      }
      
      protected function get _scrollBar() : IScrollbarWindow
      {
         if(!var_334)
         {
            var_334 = findChildByTag("_SCROLLBAR") as IScrollbarWindow;
            if(var_334)
            {
               var_334.addEventListener(WindowEvent.const_237,scrollBarEventProc);
               var_334.addEventListener(WindowEvent.const_231,scrollBarEventProc);
            }
         }
         return var_334;
      }
      
      public function removeListItemAt(param1:int) : IWindow
      {
         return _itemList.removeListItemAt(param1);
      }
      
      private function showScrollBar() : void
      {
         if(false)
         {
            _scrollBar.visible = true;
            _itemList.width = 0 - 0;
         }
      }
      
      public function addListItem(param1:IWindow) : IWindow
      {
         return _itemList.addListItem(param1);
      }
      
      public function set spacing(param1:int) : void
      {
         _itemList.spacing = param1;
      }
      
      public function get maxScrollH() : int
      {
         return _itemList.maxScrollH;
      }
      
      public function swapListItemsAt(param1:int, param2:int) : void
      {
         _itemList.swapListItemsAt(param1,param2);
      }
      
      public function getListItemByID(param1:uint) : IWindow
      {
         return _itemList.getListItemByID(param1);
      }
      
      public function get scrollH() : Number
      {
         return _itemList.scrollH;
      }
      
      public function get maxScrollV() : int
      {
         return _itemList.maxScrollV;
      }
      
      override public function dispose() : void
      {
         if(var_334)
         {
            var_334.removeEventListener(WindowEvent.const_237,scrollBarEventProc);
            var_334.removeEventListener(WindowEvent.const_231,scrollBarEventProc);
            var_334 = null;
         }
         if(var_782)
         {
            var_782 = null;
         }
         super.dispose();
      }
      
      public function get scrollV() : Number
      {
         return _itemList.scrollV;
      }
      
      private function scrollBarEventProc(param1:WindowEvent) : void
      {
         if(param1.type == WindowEvent.const_237)
         {
            showScrollBar();
         }
         else if(param1.type == WindowEvent.const_231)
         {
            hideScrollBar();
         }
      }
      
      public function set resizeOnItemUpdate(param1:Boolean) : void
      {
         _itemList.resizeOnItemUpdate = param1;
      }
      
      protected function get _itemList() : IItemListWindow
      {
         if(!var_782)
         {
            var_782 = findChildByTag("_ITEMLIST") as IItemListWindow;
         }
         return var_782;
      }
      
      public function get scaleToFitItems() : Boolean
      {
         return _itemList.scaleToFitItems;
      }
      
      public function set scrollH(param1:Number) : void
      {
         _itemList.scrollH = param1;
      }
      
      public function get scrollStepV() : Number
      {
         return _itemList.scrollStepV;
      }
      
      private function updateScrollBarVisibility() : void
      {
         if(var_1421)
         {
            if(_scrollBar.testStateFlag(WindowState.const_69))
            {
               if(false)
               {
                  hideScrollBar();
               }
            }
         }
         else if(false)
         {
            showScrollBar();
         }
      }
      
      public function set autoArrangeItems(param1:Boolean) : void
      {
         _itemList.autoArrangeItems = param1;
      }
      
      public function getListItemByName(param1:String) : IWindow
      {
         return _itemList.getListItemByName(param1);
      }
      
      public function get spacing() : int
      {
         return _itemList.spacing;
      }
      
      public function setListItemIndex(param1:IWindow, param2:int) : void
      {
         _itemList.setListItemIndex(param1,param2);
      }
      
      public function get scrollStepH() : Number
      {
         return _itemList.scrollStepH;
      }
      
      protected function isConstructionReady() : Boolean
      {
         return _itemList && _scrollBar;
      }
      
      public function get resizeOnItemUpdate() : Boolean
      {
         return _itemList.resizeOnItemUpdate;
      }
      
      public function set scrollV(param1:Number) : void
      {
         _itemList.scrollV = param1;
      }
      
      public function groupListItemsWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         return _itemList.groupListItemsWithID(param1,param2,param3);
      }
      
      public function getListItemAt(param1:uint) : IWindow
      {
         return _itemList.getListItemAt(param1);
      }
      
      public function get autoArrangeItems() : Boolean
      {
         return _itemList.autoArrangeItems;
      }
      
      public function get numListItems() : int
      {
         return _itemList.numListItems;
      }
      
      public function set scrollStepH(param1:Number) : void
      {
         _itemList.scrollStepH = param1;
      }
      
      public function set scaleToFitItems(param1:Boolean) : void
      {
         _itemList.scaleToFitItems = param1;
      }
      
      private function hideScrollBar() : void
      {
         if(false)
         {
            _scrollBar.visible = false;
            _itemList.width = var_7.width;
         }
      }
      
      public function getListItemIndex(param1:IWindow) : int
      {
         return _itemList.getListItemIndex(param1);
      }
      
      public function get iterator() : IIterator
      {
         return !!isConstructionReady() ? _itemList.iterator : null;
      }
      
      public function set autoHideScrollBar(param1:Boolean) : void
      {
         var_1421 = param1;
         updateScrollBarVisibility();
      }
      
      public function removeListItems() : void
      {
         _itemList.removeListItems();
      }
      
      public function addListItemAt(param1:IWindow, param2:uint) : IWindow
      {
         return _itemList.addListItemAt(param1,param2);
      }
      
      public function get autoHideScrollBar() : Boolean
      {
         return var_1421;
      }
      
      public function destroyListItems() : void
      {
         _itemList.destroyListItems();
      }
      
      public function swapListItems(param1:IWindow, param2:IWindow) : void
      {
         _itemList.swapListItems(param1,param2);
      }
   }
}
