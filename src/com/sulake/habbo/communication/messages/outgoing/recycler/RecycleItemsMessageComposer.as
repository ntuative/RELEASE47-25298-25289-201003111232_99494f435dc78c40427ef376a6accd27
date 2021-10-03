package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_822:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_822 = new Array();
         var_822.push(param1.length);
         var_822 = var_822.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_822;
      }
   }
}
