package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_70:IVector3d;
      
      protected var var_215:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         var_70 = param1;
         var_215 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return var_70;
      }
      
      public function get dir() : IVector3d
      {
         return var_215;
      }
   }
}
