package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_226:String = "RWUIUE_PEER";
      
      public static const const_197:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1154:String = "BOT";
      
      public static const const_918:int = 2;
      
      public static const const_1311:int = 0;
      
      public static const const_858:int = 3;
       
      
      private var var_1325:String = "";
      
      private var var_2058:Boolean = false;
      
      private var var_1937:int = 0;
      
      private var var_1709:int = 0;
      
      private var var_2057:Boolean = false;
      
      private var var_1326:String = "";
      
      private var var_2065:Boolean = false;
      
      private var var_815:int = 0;
      
      private var var_2063:Boolean = true;
      
      private var var_942:int = 0;
      
      private var var_2059:Boolean = false;
      
      private var var_1119:Boolean = false;
      
      private var var_2064:Boolean = false;
      
      private var var_1707:int = 0;
      
      private var var_2060:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_250:Array;
      
      private var var_1122:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1939:int = 0;
      
      private var var_2062:Boolean = false;
      
      private var var_2061:int = 0;
      
      private var var_1708:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_250 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1709;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1709 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2058;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2063;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2063 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2065 = param1;
      }
      
      public function get motto() : String
      {
         return var_1325;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2059 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1119;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1325 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2062;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1708;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1119 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2060;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1707 = param1;
      }
      
      public function get badges() : Array
      {
         return var_250;
      }
      
      public function get amIController() : Boolean
      {
         return var_2057;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2057 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2062 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2061 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1708 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1326 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2065;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2059;
      }
      
      public function get carryItem() : int
      {
         return var_1707;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1122;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1122 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_815 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2061;
      }
      
      public function get realName() : String
      {
         return var_1326;
      }
      
      public function set webID(param1:int) : void
      {
         var_1939 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_250 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2064 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2060 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_815;
      }
      
      public function get webID() : int
      {
         return var_1939;
      }
      
      public function set groupId(param1:int) : void
      {
         var_942 = param1;
      }
      
      public function get xp() : int
      {
         return var_1937;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2058 = param1;
      }
      
      public function get groupId() : int
      {
         return var_942;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2064;
      }
      
      public function set xp(param1:int) : void
      {
         var_1937 = param1;
      }
   }
}
