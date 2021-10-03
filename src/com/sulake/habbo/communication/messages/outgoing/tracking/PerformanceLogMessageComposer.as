package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_999:int = 0;
      
      private var var_1214:int = 0;
      
      private var var_1872:String = "";
      
      private var var_1000:int = 0;
      
      private var var_1885:String = "";
      
      private var var_1881:int = 0;
      
      private var var_1462:String = "";
      
      private var var_1884:int = 0;
      
      private var var_1882:int = 0;
      
      private var var_1871:String = "";
      
      private var var_1883:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1884 = param1;
         var_1871 = param2;
         var_1462 = param3;
         var_1872 = param4;
         var_1885 = param5;
         if(param6)
         {
            var_1214 = 1;
         }
         else
         {
            var_1214 = 0;
         }
         var_1881 = param7;
         var_1882 = param8;
         var_1000 = param9;
         var_1883 = param10;
         var_999 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1884,var_1871,var_1462,var_1872,var_1885,var_1214,var_1881,var_1882,var_1000,var_1883,var_999];
      }
      
      public function dispose() : void
      {
      }
   }
}
