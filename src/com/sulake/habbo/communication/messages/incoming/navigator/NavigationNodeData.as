package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1149:int;
      
      private var var_1536:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1149 = param1;
         var_1536 = param2;
         Logger.log("READ NODE: " + var_1149 + ", " + var_1536);
      }
      
      public function get nodeName() : String
      {
         return var_1536;
      }
      
      public function get nodeId() : int
      {
         return var_1149;
      }
   }
}
