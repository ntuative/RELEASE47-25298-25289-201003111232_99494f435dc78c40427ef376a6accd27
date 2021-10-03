package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_924:Array;
      
      private var var_897:int;
      
      private var var_1318:String;
      
      private var _offerId:int;
      
      private var var_898:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1318 = param1.readString();
         var_897 = param1.readInteger();
         var_898 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_924 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_924.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_924;
      }
      
      public function get priceInCredits() : int
      {
         return var_897;
      }
      
      public function get localizationId() : String
      {
         return var_1318;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_898;
      }
   }
}
