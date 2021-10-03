package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2046:Number;
      
      private var var_577:Number = 0;
      
      private var var_2045:Number;
      
      private var var_578:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2046 = param1;
         var_2045 = param2;
      }
      
      public function update() : void
      {
         var_578 += var_2045;
         var_577 += var_578;
         if(var_577 > 0)
         {
            var_577 = 0;
            var_578 = var_2046 * -1 * var_578;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_578 = param1;
         var_577 = 0;
      }
      
      public function get location() : Number
      {
         return var_577;
      }
   }
}
