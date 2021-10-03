package com.sulake.habbo.communication.messages.outgoing.catalog
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PurchaseFromCatalogAsGiftComposer implements IMessageComposer
   {
       
      
      private var _data:Array;
      
      public function PurchaseFromCatalogAsGiftComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int, param7:int, param8:int)
      {
         _data = [];
         super();
         _data.push(param1);
         _data.push(param2);
         _data.push(param3);
         _data.push(param4);
         _data.push(param5);
         _data.push(param6);
         _data.push(param7);
         _data.push(param8);
      }
      
      public function dispose() : void
      {
         _data = [];
      }
      
      public function getMessageArray() : Array
      {
         return _data;
      }
   }
}
