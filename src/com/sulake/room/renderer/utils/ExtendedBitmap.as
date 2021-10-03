package com.sulake.room.renderer.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class ExtendedBitmap extends Bitmap
   {
       
      
      private var _bitmapData:ExtendedBitmapData = null;
      
      public function ExtendedBitmap()
      {
         super();
      }
      
      override public function set bitmapData(param1:BitmapData) : void
      {
         if(param1 == bitmapData)
         {
            return;
         }
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
         }
         var _loc2_:ExtendedBitmapData = param1 as ExtendedBitmapData;
         if(_loc2_ != null)
         {
            _loc2_.addReference();
            _bitmapData = _loc2_;
         }
         else
         {
            _bitmapData = null;
         }
         super.bitmapData = param1;
      }
      
      public function get disposed() : Boolean
      {
         if(_bitmapData != null)
         {
            return _bitmapData.disposed;
         }
         return false;
      }
      
      public function dispose() : void
      {
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
      }
   }
}
