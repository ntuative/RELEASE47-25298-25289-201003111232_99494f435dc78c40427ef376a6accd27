package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import flash.display.BitmapData;
   
   public class TutorialCallGuideBotView implements ITutorialUIView
   {
       
      
      private var _main:TutorialUI;
      
      private var var_573:IWindowContainer;
      
      public function TutorialCallGuideBotView(param1:IItemListWindow, param2:TutorialUI)
      {
         super();
         _main = param2;
         var _loc3_:IWindowContainer = param2.method_1("tutorial_call_guidebot") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.procedure = windowProcedure;
         param1.addListItem(_loc3_ as IWindow);
         setToolbarIconHighlight(true);
         _main.prepareForTutorial();
         _main.help.toolbar.events.addEventListener(HabboToolbarShowMenuEvent.const_46,onShowMenuEvent);
      }
      
      public function get id() : String
      {
         return TutorialUI.const_438;
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param2.name)
         {
            case "button_cancel":
               if(param1.type == WindowMouseEvent.const_49)
               {
                  _main.showView(TutorialUI.const_86);
               }
         }
      }
      
      private function showToolbarIconHighlightArrow() : void
      {
         var _loc2_:* = null;
         if(var_573 != null)
         {
            return;
         }
         var_573 = _main.method_1("tutorial_arrow") as IWindowContainer;
         var _loc1_:IBitmapWrapperWindow = var_573.findChildByName("arrow") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc2_ = BitmapDataAsset(_main.assets.getAssetByName("tutorial_highlight_blue_arrow"));
            _loc1_.bitmap = (_loc2_.content as BitmapData).clone();
         }
         _main.help.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.HELP_ARROW,var_573));
      }
      
      public function get view() : IWindowContainer
      {
         return null;
      }
      
      private function onShowMenuEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(param1.menuId == HabboToolbarIconEnum.HELP && param1.type == HabboToolbarShowMenuEvent.const_46)
         {
            setToolbarIconHighlight(false);
            hideToolbarIconHighlightArrow();
         }
      }
      
      private function hideToolbarIconHighlightArrow() : void
      {
         if(var_573 != null)
         {
            var_573.dispose();
            var_573 = null;
         }
      }
      
      public function setToolbarIconHighlight(param1:Boolean) : void
      {
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_171,HabboToolbarIconEnum.HELP);
         if(param1)
         {
            _loc2_.iconState = "highlight_blue";
            showToolbarIconHighlightArrow();
         }
         else
         {
            _loc2_.iconState = "0";
            hideToolbarIconHighlightArrow();
         }
         _main.help.toolbar.events.dispatchEvent(_loc2_);
      }
      
      public function dispose() : void
      {
         setToolbarIconHighlight(false);
         _main.help.toolbar.events.removeEventListener(HabboToolbarShowMenuEvent.const_46,onShowMenuEvent);
      }
   }
}
