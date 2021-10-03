package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_415:int = 0;
      
      public static const const_106:int = 2;
      
      public static const const_177:int = 1;
      
      public static const const_691:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1826:Boolean;
      
      private var var_1827:Boolean;
      
      private var var_1829:int;
      
      private var var_1824:Array;
      
      private var var_1823:int;
      
      private var var_1830:Boolean;
      
      private var var_1112:String;
      
      private var var_1825:int;
      
      private var var_1828:int;
      
      private var var_1327:int;
      
      private var _roomId:int;
      
      private var var_622:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1825;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1825 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1830;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1823 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1824 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_622 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1826;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1827;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1829;
      }
      
      public function get categoryId() : int
      {
         return var_1327;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1830 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1823;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1824;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1828 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1826 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1827 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1829 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1828;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1327 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1112 = param1;
      }
      
      public function get description() : String
      {
         return var_1112;
      }
   }
}
