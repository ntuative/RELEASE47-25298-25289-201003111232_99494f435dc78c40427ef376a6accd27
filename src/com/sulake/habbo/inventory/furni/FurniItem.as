package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1850:int;
      
      private var var_2100:Boolean;
      
      private var var_1987:int;
      
      private var var_1380:String;
      
      private var var_2101:Boolean = false;
      
      private var var_1952:int;
      
      private var var_439:int;
      
      private var var_1034:String;
      
      private var var_1867:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1334:int;
      
      private var var_2099:Boolean;
      
      private var var_2102:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1850 = param1;
         var_1034 = param2;
         _objId = param3;
         var_1334 = param4;
         var_1380 = param5;
         var_2100 = param6;
         var_2099 = param7;
         var_1952 = param8;
         var_1867 = param9;
         var_1987 = param10;
         var_439 = -1;
      }
      
      public function get songId() : int
      {
         return var_1987;
      }
      
      public function get iconCallbackId() : int
      {
         return var_439;
      }
      
      public function get expiryTime() : int
      {
         return var_1952;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2102 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2101 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_439 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2099;
      }
      
      public function get slotId() : String
      {
         return var_1867;
      }
      
      public function get classId() : int
      {
         return var_1334;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2100;
      }
      
      public function get stuffData() : String
      {
         return var_1380;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1850;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2101;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2102;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1034;
      }
   }
}
