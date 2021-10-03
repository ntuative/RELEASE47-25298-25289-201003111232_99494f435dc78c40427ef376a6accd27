package com.sulake.habbo.avatar.structure.parts
{
   public class ActivePartSet
   {
       
      
      private var var_583:Array;
      
      private var _id:String;
      
      public function ActivePartSet(param1:XML)
      {
         var _loc2_:* = null;
         super();
         _id = String(param1.@id);
         var_583 = new Array();
         for each(_loc2_ in param1.activePart)
         {
            var_583.push(String(_loc2_["set-type"]));
         }
      }
      
      public function get parts() : Array
      {
         return var_583;
      }
   }
}
