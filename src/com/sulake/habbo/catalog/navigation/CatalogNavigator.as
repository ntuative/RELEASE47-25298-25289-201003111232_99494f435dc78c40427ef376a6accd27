package com.sulake.habbo.catalog.navigation
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   
   public class CatalogNavigator implements ICatalogNavigator
   {
       
      
      private var _container:IWindowContainer;
      
      private var _scrollBar:IScrollbarWindow;
      
      private var _index:ICatalogNode;
      
      private var var_271:Array;
      
      private var _catalog:IHabboCatalog;
      
      private var var_2345:String = "magic.pixels";
      
      private var var_2344:String = "catalog.page.club";
      
      private var var_2375:String = "magic.credits";
      
      private var var_49:IItemListWindow;
      
      public function CatalogNavigator(param1:IHabboCatalog, param2:IWindowContainer)
      {
         super();
         _catalog = param1;
         _container = param2;
         var_271 = [];
         var_49 = _container.findChildByName("navigationList") as IItemListWindow;
         var _loc3_:IWindow = _container.findChildByName("creditsContainer");
         var _loc4_:IWindow = _container.findChildByName("pixelsContainer");
         var _loc5_:IWindow = _container.findChildByName("clubContainer");
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onNavigatorEvent);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onNavigatorEvent);
         _loc3_.addEventListener(WindowMouseEvent.const_29,onNavigatorEvent);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onNavigatorEvent);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onNavigatorEvent);
         _loc4_.addEventListener(WindowMouseEvent.const_29,onNavigatorEvent);
         _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onNavigatorEvent);
         _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onNavigatorEvent);
         _loc5_.addEventListener(WindowMouseEvent.const_29,onNavigatorEvent);
         _scrollBar = _container.findChildByName("navigationListScrollbar") as IScrollbarWindow;
         if(_scrollBar != null)
         {
            _scrollBar.visible = false;
            _scrollBar.addEventListener(WindowEvent.const_578,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_237,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.WINDOW_EVENT_DISABLE,deActivateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_231,deActivateScrollbar);
         }
      }
      
      private function getFirstNodeByName(param1:String, param2:ICatalogNode) : ICatalogNode
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2.localization == param1 && param2 != _index)
         {
            return param2;
         }
         for each(_loc3_ in param2.children)
         {
            _loc4_ = getFirstNodeByName(param1,_loc3_);
            if(_loc4_ != null)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      private function onNavigatorEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         var _loc3_:String = IWindow(param1.target).name;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.color = 4281692560;
               break;
            case WindowMouseEvent.const_29:
               _loc2_.color = 4280767850;
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               switch(_loc3_)
               {
                  case "creditsContainer":
                     openCreditsPage();
                     break;
                  case "pixelsContainer":
                     openPixelsPage();
                     break;
                  case "clubContainer":
                     openClubPage();
               }
         }
      }
      
      private function openCreditsPage() : void
      {
         var _loc2_:* = null;
         if(_catalog == null || true)
         {
            return;
         }
         var _loc1_:* = _catalog.configuration.getKey("client.credits.embed.enabled","false") == "true";
         if(false && _loc1_)
         {
            ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
         }
         else
         {
            _loc2_ = _catalog.configuration.getKey("link.format.credits","/credits");
            _catalog.windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onExternalLink);
            HabboWebTools.navigateToURL(_loc2_,"habboMain");
         }
      }
      
      private function openPixelsPage() : void
      {
         openPage(var_2345);
      }
      
      private function openClubPage() : void
      {
         _catalog.openCatalogPage(var_2344,true);
      }
      
      public function activateNode(param1:ICatalogNode) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc2_:* = var_271.indexOf(param1) > -1;
         var _loc3_:Boolean = param1.isOpen;
         var _loc4_:* = [];
         for each(_loc5_ in var_271)
         {
            _loc5_.deActivate();
            if(_loc5_.depth >= param1.depth)
            {
               _loc4_.push(_loc5_);
            }
         }
         for each(_loc6_ in _loc4_)
         {
            _loc6_.close();
            _loc7_ = var_271.indexOf(_loc6_);
            var_271.splice(_loc7_,1);
         }
         param1.activate();
         if(_loc2_ && _loc3_)
         {
            param1.close();
         }
         else
         {
            param1.open();
         }
         if(var_271.indexOf(param1) == -1)
         {
            var_271.push(param1);
         }
         _catalog.loadCatalogPage(param1.pageId);
         _catalog.events.dispatchEvent(new CatalogPageOpenedEvent(param1.pageId,param1.localization));
      }
      
      public function buildCatalogIndex(param1:NodeData) : void
      {
         var _loc2_:* = null;
         _index = null;
         _index = buildIndexNode(param1,0);
         for each(_loc2_ in _index.children)
         {
            if(_loc2_.isNavigateable)
            {
               (_loc2_ as CatalogNodeRenderable).addToList(var_49);
            }
         }
      }
      
      private function getNodeByName(param1:String) : ICatalogNode
      {
         return getFirstNodeByName(param1,_index);
      }
      
      private function onExternalLink(param1:IAlertDialog, param2:Event) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.dispose();
      }
      
      private function getFirstNavigateable(param1:ICatalogNode) : ICatalogNode
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.isNavigateable && param1 != _index)
         {
            return param1;
         }
         for each(_loc2_ in param1.children)
         {
            _loc3_ = getFirstNavigateable(_loc2_);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      private function activateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = true;
      }
      
      private function openNavigatorAtNode(param1:ICatalogNode) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in var_271)
         {
            _loc2_.deActivate();
            _loc2_.close();
         }
         var_271 = [];
         _loc3_ = param1.parent;
         while(_loc3_ != null && _loc3_.parent != null)
         {
            _loc3_.open();
            var_271.push(_loc3_);
            _loc3_ = _loc3_.parent;
         }
         activateNode(param1);
      }
      
      private function deActivateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = false;
      }
      
      public function openFrontPage() : void
      {
         var _loc1_:ICatalogNode = getFirstNavigateable(_index);
         Logger.log("Load front page: " + _loc1_.localization + "(" + _loc1_.pageId + ")");
         _catalog.loadCatalogPage(_loc1_.pageId);
      }
      
      public function dispose() : void
      {
         _catalog = null;
         _container = null;
         var_49 = null;
         _index.dispose();
         _index = null;
         var_271 = null;
         _scrollBar = null;
      }
      
      public function openPage(param1:String) : void
      {
         var _loc2_:ICatalogNode = getNodeByName(param1);
         if(_loc2_ != null)
         {
            _catalog.loadCatalogPage(_loc2_.pageId);
            openNavigatorAtNode(_loc2_);
         }
      }
      
      private function buildIndexNode(param1:NodeData, param2:int) : ICatalogNode
      {
         var _loc5_:* = null;
         var _loc3_:Boolean = param1.navigateable;
         var _loc4_:* = null;
         if(!_loc3_)
         {
            _loc4_ = new CatalogNode(this,param1,param2) as ICatalogNode;
         }
         else
         {
            _loc4_ = new CatalogNodeRenderable(this,param1,param2) as ICatalogNode;
         }
         if(_loc4_ == null)
         {
            Logger.log("Catalog index node creation failed!");
            return null;
         }
         param2++;
         for each(_loc5_ in param1.nodes)
         {
            _loc4_.addChild(buildIndexNode(_loc5_,param2));
         }
         return _loc4_;
      }
   }
}
