package com.sulake.habbo.avatar.legs
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
   
   public class LegsView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      private var _model:LegsModel;
      
      public function LegsView(param1:LegsModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3);
         _model = param1;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_legs_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         if(!var_32)
         {
            var_32 = new Dictionary();
         }
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_142,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_175,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_153,param2,param3);
         _window.visible = false;
         _window.procedure = windowEventProc;
         attachImages();
         switchCategory(FigureData.const_142);
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_pants":
                  switchCategory(FigureData.const_142);
                  break;
               case "tab_shoes":
                  switchCategory(FigureData.const_175);
                  break;
               case "tab_belts":
                  switchCategory(FigureData.const_153);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
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
            case FigureData.const_142:
               var_38 = "tab_pants";
               break;
            case FigureData.const_175:
               var_38 = "tab_shoes";
               break;
            case FigureData.const_153:
               var_38 = "tab_belts";
               break;
            default:
               throw new Error("[LegsView] Unknown item category: \"" + param1 + "\"");
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
