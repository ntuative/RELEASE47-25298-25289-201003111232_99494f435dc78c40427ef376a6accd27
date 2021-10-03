package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserBadgesEvent extends RoomSessionEvent
   {
      
      public static const const_122:String = "RSUBE_BADGES";
       
      
      private var _userId:int = 0;
      
      private var var_250:Array;
      
      public function RoomSessionUserBadgesEvent(param1:IRoomSession, param2:int, param3:Array, param4:Boolean = false, param5:Boolean = false)
      {
         var_250 = [];
         super(const_122,param1,param4,param5);
         _userId = param2;
         var_250 = param3;
      }
      
      public function get badges() : Array
      {
         return var_250;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
