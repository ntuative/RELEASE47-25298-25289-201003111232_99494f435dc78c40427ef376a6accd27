package com.sulake.habbo.avatar.palette
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class PaletteMap
   {
       
      
      private var _blank:Array;
      
      private var var_510:Array;
      
      public function PaletteMap(param1:ByteArray)
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         super();
         var_510 = new Array();
         param1.position = 0;
         while(param1.bytesAvailable >= 3)
         {
            _loc2_ = uint(param1.readUnsignedByte());
            _loc3_ = uint(param1.readUnsignedByte());
            _loc4_ = uint(param1.readUnsignedByte());
            _loc5_ = uint(_loc2_ << 16 | _loc3_ << 8 | _loc4_);
            var_510.push(_loc5_);
         }
         _blank = new Array();
         while(true)
         {
            _blank.push(0);
         }
      }
      
      public function colorizeBitmap(param1:BitmapData) : void
      {
         param1.paletteMap(param1,param1.rect,new Point(0,0),_blank,var_510,_blank,_blank);
      }
      
      public function invert() : void
      {
         var _loc1_:Array = new Array();
         while(false)
         {
            _loc1_.push(var_510.pop());
         }
         var_510 = _loc1_;
      }
      
      public function colorize(param1:ByteArray) : ByteArray
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc2_:ByteArray = new ByteArray();
         param1.position = 0;
         while(param1.bytesAvailable >= 4)
         {
            _loc3_ = uint(param1.readUnsignedByte());
            _loc4_ = uint(param1.readUnsignedByte());
            _loc5_ = uint(param1.readUnsignedByte());
            _loc6_ = uint(param1.readUnsignedByte());
            _loc7_ = uint(var_510[_loc5_] as uint);
            _loc2_.writeUnsignedInt(_loc3_ << 24 | _loc7_);
         }
         _loc2_.position = 0;
         return _loc2_;
      }
      
      public function getIndex(param1:uint) : int
      {
         var _loc2_:int = var_510.indexOf(param1);
         return _loc2_ < 0 ? 0 : int(_loc2_);
      }
   }
}
