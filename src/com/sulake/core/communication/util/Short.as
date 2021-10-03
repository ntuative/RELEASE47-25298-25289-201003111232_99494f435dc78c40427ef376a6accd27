package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_740:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_740 = new ByteArray();
         var_740.writeShort(param1);
         var_740.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_740.position = 0;
         if(false)
         {
            _loc1_ = var_740.readShort();
            var_740.position = 0;
         }
         return _loc1_;
      }
   }
}
