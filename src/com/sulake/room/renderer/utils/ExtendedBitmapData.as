package com.sulake.room.renderer.utils
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ExtendedBitmapData extends BitmapData
   {
       
      
      private var var_790:int = 0;
      
      private var _disposed:Boolean = false;
      
      public function ExtendedBitmapData(param1:int, param2:int, param3:Boolean = true, param4:uint = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      public function addReference() : void
      {
         ++var_790;
      }
      
      public function get referenceCount() : int
      {
         return var_790;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function clone() : BitmapData
      {
         var _loc1_:ExtendedBitmapData = new ExtendedBitmapData(width,height,true,16777215);
         _loc1_.copyPixels(this,rect,new Point(0,0),null,null,true);
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(--var_790 <= 0)
         {
            super.dispose();
            _disposed = true;
         }
      }
   }
}
