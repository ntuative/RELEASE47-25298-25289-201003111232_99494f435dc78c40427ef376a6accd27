package com.sulake.habbo.avatar.generic
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class GenericView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      private var _model:GenericModel;
      
      public function GenericView(param1:GenericModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3);
         _model = param1;
         if(!var_32)
         {
            var_32 = new Dictionary();
         }
         var_32["null"] = new AvatarEditorGridView(param1,FigureData.const_56,param2,param3);
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_generic_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         _window.visible = false;
         _window.procedure = windowEventProc;
         attachImages();
         switchCategory(FigureData.const_56);
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_boy":
                  _model.categorySwitch(FigureData.const_81);
                  param1.stopPropagation();
                  break;
               case "tab_girl":
                  _model.categorySwitch(FigureData.FEMALE);
                  param1.stopPropagation();
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_boy":
               case "tab_girl":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            switch(param2.name)
            {
               case "tab_boy":
               case "tab_girl":
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
         if(_model == null)
         {
            return;
         }
         if(var_32 == null)
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
         switch(_model.controller.gender)
         {
            case FigureData.const_81:
               var_38 = "tab_boy";
               break;
            case FigureData.FEMALE:
               var_38 = "tab_girl";
         }
         activateTab(var_38);
         var_286 = param1;
         var _loc3_:IWindowContainer = _window.findChildByName("grid_container") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.removeChildAt(0);
         var _loc4_:AvatarEditorGridView = var_32[var_286];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:IWindowContainer = _loc4_.window;
         if(_loc5_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         _loc3_.addChild(_loc5_);
         _loc3_.invalidate();
         if(_loc4_.firstView)
         {
            _loc4_.initFromList();
         }
      }
      
      public function updateItem(param1:String, param2:AvatarEditorGridPartItem, param3:int) : void
      {
         if(var_32 == null)
         {
            return;
         }
         var _loc4_:AvatarEditorGridView = var_32[param1];
         if(_loc4_ != null)
         {
            _loc4_.updateItem(param3,param2.view);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _model = null;
      }
   }
}
