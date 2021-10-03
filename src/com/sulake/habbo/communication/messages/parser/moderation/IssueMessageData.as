package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_152:int = 1;
      
      public static const const_1323:int = 3;
      
      public static const const_482:int = 2;
       
      
      private var var_2179:int;
      
      private var var_1926:int;
      
      private var var_2181:int;
      
      private var var_1901:int;
      
      private var var_35:int;
      
      private var var_437:int;
      
      private var var_1298:int;
      
      private var var_1859:int;
      
      private var var_996:int;
      
      private var _roomResources:String;
      
      private var var_2002:int;
      
      private var var_2180:int;
      
      private var var_2183:String;
      
      private var var_1858:String;
      
      private var var_2177:int = 0;
      
      private var var_1201:String;
      
      private var _message:String;
      
      private var var_1898:int;
      
      private var var_2178:String;
      
      private var var_1327:int;
      
      private var var_668:String;
      
      private var var_2182:String;
      
      private var var_1546:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_996 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2177 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2180;
      }
      
      public function set roomName(param1:String) : void
      {
         var_668 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_2002 = param1;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_668;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1901 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_35 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1926;
      }
      
      public function get priority() : int
      {
         return var_2179 + var_2177;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1859 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1858;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1546) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1327;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2180 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1298;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2183 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_2002;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1901;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2182 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1201 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1859;
      }
      
      public function set priority(param1:int) : void
      {
         var_2179 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1926 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2183;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2181 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1858 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1898 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1201;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1298 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2181;
      }
      
      public function set flatId(param1:int) : void
      {
         var_437 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1327 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1546 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1898;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2178 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1546;
      }
      
      public function get reportedUserId() : int
      {
         return var_996;
      }
      
      public function get flatId() : int
      {
         return var_437;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2182;
      }
      
      public function get reporterUserName() : String
      {
         return var_2178;
      }
   }
}
