package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_80:HabboNotificationItemStyle;
      
      private var var_21:String;
      
      private var var_24:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         var_21 = param1;
         var_80 = param2;
         var_24 = param3;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_80.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(var_24 != null)
            {
               var_24.onExecuteLink(_loc2_);
            }
         }
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return var_80;
      }
      
      public function get content() : String
      {
         return var_21;
      }
   }
}
