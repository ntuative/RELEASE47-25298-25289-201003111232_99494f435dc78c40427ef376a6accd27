package com.sulake.habbo.navigator.domain
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomLayout
   {
       
      
      private var _view:IWindowContainer;
      
      private var var_1627:int;
      
      private var _tileSize:int;
      
      private var _name:String;
      
      public function RoomLayout(param1:int, param2:int, param3:String)
      {
         super();
         var_1627 = param1;
         _tileSize = param2;
         _name = param3;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get view() : IWindowContainer
      {
         return _view;
      }
      
      public function get tileSize() : int
      {
         return _tileSize;
      }
      
      public function get requiredClubLevel() : int
      {
         return var_1627;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         _view = param1;
      }
   }
}
