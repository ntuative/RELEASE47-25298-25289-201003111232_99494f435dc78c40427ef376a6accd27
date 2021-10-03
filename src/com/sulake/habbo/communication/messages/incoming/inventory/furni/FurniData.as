package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1380:String;
      
      private var var_1034:String;
      
      private var var_2164:Boolean;
      
      private var var_1401:int;
      
      private var var_1850:int;
      
      private var var_2165:Boolean;
      
      private var var_1867:String = "";
      
      private var var_2100:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1334:int;
      
      private var var_2099:Boolean;
      
      private var var_1987:int = -1;
      
      private var var_1952:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1850 = param1;
         var_1034 = param2;
         _objId = param3;
         var_1334 = param4;
         _category = param5;
         var_1380 = param6;
         var_2164 = param7;
         var_2100 = param8;
         var_2099 = param9;
         var_2165 = param10;
         var_1952 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1867;
      }
      
      public function get extra() : int
      {
         return var_1401;
      }
      
      public function get classId() : int
      {
         return var_1334;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2165;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2164;
      }
      
      public function get stripId() : int
      {
         return var_1850;
      }
      
      public function get stuffData() : String
      {
         return var_1380;
      }
      
      public function get songId() : int
      {
         return var_1987;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1867 = param1;
         var_1401 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1034;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1952;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2099;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2100;
      }
   }
}
