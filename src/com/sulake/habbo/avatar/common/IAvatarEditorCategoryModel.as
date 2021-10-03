package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   
   public interface IAvatarEditorCategoryModel
   {
       
      
      function hasClubItemsOverLevel(param1:int) : Boolean;
      
      function toggleItemSelection(param1:String, param2:int) : void;
      
      function closingEditorView() : void;
      
      function toggleColorLayerSelection(param1:String, param2:int) : void;
      
      function getCategoryContent(param1:String) : CategoryData;
      
      function updateView() : void;
      
      function reset() : void;
      
      function categorySwitch(param1:String) : void;
      
      function getWindowContainer() : IWindowContainer;
      
      function get controller() : HabboAvatarEditor;
      
      function toggleColorSelection(param1:String, param2:int) : void;
      
      function stripClubItemsOverLevel(param1:int) : void;
      
      function dispose() : void;
   }
}
