package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_129:String = "RWPUE_VOTE_RESULT";
      
      public static const const_117:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1114:int;
      
      private var var_1060:String;
      
      private var var_739:Array;
      
      private var var_943:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1060 = param2;
         var_943 = param3;
         var_739 = param4;
         if(var_739 == null)
         {
            var_739 = [];
         }
         var_1114 = param5;
      }
      
      public function get votes() : Array
      {
         return var_739.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1114;
      }
      
      public function get question() : String
      {
         return var_1060;
      }
      
      public function get choices() : Array
      {
         return var_943.slice();
      }
   }
}
