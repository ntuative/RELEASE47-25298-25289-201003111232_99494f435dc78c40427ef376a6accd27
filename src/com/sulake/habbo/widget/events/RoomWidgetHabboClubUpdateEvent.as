package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_230:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1932:Boolean = false;
      
      private var var_1931:int = 0;
      
      private var var_1930:int = 0;
      
      private var var_1933:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_230,param5,param6);
         var_1933 = param1;
         var_1930 = param2;
         var_1931 = param3;
         var_1932 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1931;
      }
      
      public function get periodsLeft() : int
      {
         return var_1930;
      }
      
      public function get daysLeft() : int
      {
         return var_1933;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1932;
      }
   }
}
