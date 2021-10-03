package com.sulake.habbo.avatar.torso
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
   
   public class TorsoView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      private var _model:TorsoModel;
      
      public function TorsoView(param1:TorsoModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3);
         _model = param1;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_torso_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         if(!var_32)
         {
            var_32 = new Dictionary();
         }
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_149,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.SHIRT,param2,param3);
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.CHEST_ACCESSORIES,param2,param3);
         _window.visible = false;
         _window.procedure = windowEventProc;
         attachImages();
         switchCategory(FigureData.SHIRT);
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_jacket":
                  switchCategory(FigureData.const_149);
                  break;
               case "tab_shirt":
                  switchCategory(FigureData.SHIRT);
                  break;
               case "tab_accessories":
                  switchCategory(FigureData.CHEST_ACCESSORIES);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_jacket":
               case "tab_shirt":
               case "tab_accessories":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            switch(param2.name)
            {
               case "tab_jacket":
               case "tab_shirt":
               case "tab_accessories":
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
            case FigureData.SHIRT:
               var_38 = "tab_shirt";
               break;
            case FigureData.const_149:
               var_38 = "tab_jacket";
               break;
            case FigureData.CHEST_ACCESSORIES:
               var_38 = "tab_accessories";
               break;
            default:
               throw new Error("[TorsoView] Unknown item category: \"" + param1 + "\"");
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
