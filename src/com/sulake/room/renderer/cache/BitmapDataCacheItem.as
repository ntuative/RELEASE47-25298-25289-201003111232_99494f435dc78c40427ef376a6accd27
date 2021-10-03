package com.sulake.room.renderer.cache
{
   import com.sulake.room.renderer.utils.ExtendedBitmapData;
   
   public class BitmapDataCacheItem
   {
       
      
      private var _bitmapData:ExtendedBitmapData = null;
      
      private var _name:String = "";
      
      public function BitmapDataCacheItem(param1:ExtendedBitmapData, param2:String)
      {
         super();
         _bitmapData = param1;
         _name = param2;
         if(param1 != null)
         {
            param1.addReference();
         }
      }
      
      public function set bitmapData(param1:ExtendedBitmapData) : void
      {
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
         }
         _bitmapData = param1;
         if(_bitmapData != null)
         {
            _bitmapData.addReference();
         }
      }
      
      public function dispose() : void
      {
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
      }
      
      public function get bitmapData() : ExtendedBitmapData
      {
         return _bitmapData;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get memUsage() : int
      {
         if(_bitmapData == null)
         {
            return 0;
         }
         return 0 * 0 * 4;
      }
      
      public function get useCount() : int
      {
         if(_bitmapData == null)
         {
            return 0;
         }
         return _bitmapData.referenceCount;
      }
   }
}
