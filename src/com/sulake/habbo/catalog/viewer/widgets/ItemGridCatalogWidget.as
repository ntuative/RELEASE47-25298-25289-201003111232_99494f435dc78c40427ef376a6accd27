package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.viewer.BundleProductContainer;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ItemGridCatalogWidget extends CatalogWidget implements ICatalogWidget, IItemGrid
   {
       
      
      private var var_882:int = 0;
      
      private var var_166:Timer;
      
      private var _scrollBar:IScrollbarWindow;
      
      protected var var_308:IGridItem;
      
      protected var var_138:Boolean = true;
      
      protected var var_936:IItemGridWindow;
      
      private var var_1544:int = 0;
      
      protected var var_1379:XML;
      
      public function ItemGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         _scrollBar = _window.findChildByName("itemGridScrollbar") as IScrollbarWindow;
         if(_scrollBar != null)
         {
            _scrollBar.visible = false;
            _scrollBar.addEventListener(WindowEvent.const_578,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_237,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.WINDOW_EVENT_DISABLE,deActivateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_231,deActivateScrollbar);
         }
      }
      
      override public function dispose() : void
      {
         if(var_166 != null)
         {
            var_166.stop();
            var_166.removeEventListener(TimerEvent.TIMER,populateItemGrid);
            var_166 = null;
         }
         var_936.destroyGridItems();
         var_936 = null;
         var_1379 = null;
         var_308 = null;
         super.dispose();
      }
      
      protected function populateItemGrid(param1:TimerEvent = null) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc2_ = param1.currentTarget.currentCount;
            if(var_882 == page.offers.length)
            {
               (param1.target as Timer).removeEventListener(TimerEvent.TIMER,populateItemGrid);
               (param1.target as Timer).stop();
            }
         }
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            if(var_882 >= 0 && var_882 < page.offers.length)
            {
               _loc4_ = page.offers[var_882];
               createGridItem(_loc4_);
               _loc4_.productContainer.grid = this;
            }
            ++var_882;
            _loc3_++;
         }
      }
      
      protected function createGridItem(param1:Offer) : void
      {
         var _loc2_:IWindowContainer = page.viewer.catalog.windowManager.buildFromXML(var_1379) as IWindowContainer;
         var_936.addGridItem(_loc2_);
         param1.productContainer.view = _loc2_;
         param1.productContainer.initProductIcon(page.viewer.roomEngine);
         if(param1.pricingModel == Offer.const_470)
         {
            ++var_1544;
            (param1.productContainer as BundleProductContainer).setBundleCounter(var_1544);
         }
      }
      
      override public function init() : void
      {
         var_936 = _window.findChildByName("itemGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset;
         var_1379 = _loc1_.content as XML;
         populateItemGrid();
         if(var_138)
         {
            var_166 = new Timer(25);
            var_166.addEventListener(TimerEvent.TIMER,populateItemGrid);
            var_166.start();
         }
      }
      
      private function deActivateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = false;
      }
      
      private function activateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = true;
      }
      
      public function select(param1:IGridItem) : void
      {
         if(var_308 != null)
         {
            var_308.deActivate();
         }
         var_308 = param1;
         param1.activate();
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
      }
   }
}
