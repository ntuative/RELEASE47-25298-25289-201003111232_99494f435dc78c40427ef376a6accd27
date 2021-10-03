package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2010:Boolean = false;
      
      private var var_2007:int = 0;
      
      private var var_2011:int = 0;
      
      private var var_2008:int = 0;
      
      private var var_1525:int = 0;
      
      private var var_2009:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1525 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2007;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2010;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2010 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2007 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_2011 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1525;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2008 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_2011;
      }
      
      public function get pixelBalance() : int
      {
         return var_2008;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_2009 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_2009;
      }
   }
}
