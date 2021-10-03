package com.sulake.habbo.avatar.head
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class HeadView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      private var _model:HeadModel;
      
      public function HeadView(param1:HeadModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3);
         _model = param1;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_head_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         if(!var_32)
         {
            var_32 = new Dictionary();
         }
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_114,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_141,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_136,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_150,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_140,param2,param3);
         _window.visible = false;
         _window.procedure = windowEventProc;
         attachImages();
         switchCategory(FigureData.const_114);
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_hair":
                  switchCategory(FigureData.const_114);
                  break;
               case "tab_hat":
                  switchCategory(FigureData.const_141);
                  break;
               case "tab_accessories":
                  switchCategory(FigureData.const_136);
                  break;
               case "tab_eyewear":
                  switchCategory(FigureData.const_150);
                  break;
               case "tab_masks":
                  switchCategory(FigureData.const_140);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_hair":
               case "tab_hat":
               case "tab_accessories":
               case "tab_eyewear":
               case "tab_masks":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            switch(param2.name)
            {
               case "tab_hair":
               case "tab_hat":
               case "tab_accessories":
               case "tab_eyewear":
               case "tab_masks":
                  if(var_38 != param2.name)
                  {
                     inactivateTab(param2.name);
                  }
            }
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_286 == param1)
         {
            return;
         }
         var _loc2_:ISelectorWindow = _window.findChildByName("category_selector") as ISelectorWindow;
         inactivateTab(var_38);
         switch(param1)
         {
            case FigureData.const_114:
               var_38 = "tab_hair";
               break;
            case FigureData.const_141:
               var_38 = "tab_hat";
               break;
            case FigureData.const_136:
               var_38 = "tab_accessories";
               break;
            case FigureData.const_150:
               var_38 = "tab_eyewear";
               break;
            case FigureData.const_140:
               var_38 = "tab_masks";
               break;
            default:
               throw new Error("[HeadView] Unknown item category: \"" + param1 + "\"");
         }
         activateTab(var_38);
         var_286 = param1;
         _model.categorySwitch(param1);
         changeToCurrentTab();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _model = null;
      }
   }
}
