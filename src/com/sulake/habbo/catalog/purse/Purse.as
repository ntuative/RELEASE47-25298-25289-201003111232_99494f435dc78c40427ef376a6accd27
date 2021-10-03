package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2011:int = 0;
      
      private var var_2235:int = 0;
      
      private var var_2192:int = 0;
      
      private var var_2009:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_2235;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2235 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_2011 = param1;
      }
      
      public function get credits() : int
      {
         return var_2192;
      }
      
      public function get clubDays() : int
      {
         return var_2011;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_2009 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2192 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_2009;
      }
   }
}
