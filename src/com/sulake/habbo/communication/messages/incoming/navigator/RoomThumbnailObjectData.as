package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1455:int;
      
      private var var_1454:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1455;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1455 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1455 = this.var_1455;
         _loc1_.var_1454 = this.var_1454;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1454 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1454;
      }
   }
}
