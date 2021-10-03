package com.sulake.habbo.communication.messages.outgoing.inventory.furni
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RequestRoomPropertySet implements IMessageComposer
   {
       
      
      private var var_1850:int = 0;
      
      public function RequestRoomPropertySet(param1:int)
      {
         super();
         var_1850 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(var_1850);
         return _loc1_;
      }
   }
}
