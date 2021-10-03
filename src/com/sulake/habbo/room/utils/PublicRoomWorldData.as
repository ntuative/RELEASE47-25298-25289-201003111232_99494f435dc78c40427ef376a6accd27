package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1864:Number = 1;
      
      private var var_187:Number = 1;
      
      private var var_2130:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2130 = param1;
         var_187 = param2;
         var_1864 = param3;
      }
      
      public function get scale() : Number
      {
         return var_187;
      }
      
      public function get heightScale() : Number
      {
         return var_1864;
      }
   }
}
