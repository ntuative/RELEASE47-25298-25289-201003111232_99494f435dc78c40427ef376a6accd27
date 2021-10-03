package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_806:String = "price_type_none";
      
      public static const const_384:String = "pricing_model_multi";
      
      public static const const_422:String = "price_type_credits";
      
      public static const const_383:String = "price_type_credits_and_pixels";
      
      public static const const_470:String = "pricing_model_bundle";
      
      public static const const_418:String = "pricing_model_single";
      
      public static const const_651:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1144:String = "pricing_model_unknown";
      
      public static const const_366:String = "price_type_pixels";
       
      
      private var var_897:int;
      
      private var _offerId:int;
      
      private var var_898:int;
      
      private var var_416:String;
      
      private var var_598:String;
      
      private var var_2146:int;
      
      private var var_551:ICatalogPage;
      
      private var var_1318:String;
      
      private var var_415:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1318 = param1.localizationId;
         var_897 = param1.priceInCredits;
         var_898 = param1.priceInPixels;
         var_551 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_416;
      }
      
      public function get page() : ICatalogPage
      {
         return var_551;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2146 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_415;
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
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1318 = "";
         var_897 = 0;
         var_898 = 0;
         var_551 = null;
         if(var_415 != null)
         {
            var_415.dispose();
            var_415 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_598;
      }
      
      public function get previewCallbackId() : int
      {
         return var_2146;
      }
      
      public function get priceInCredits() : int
      {
         return var_897;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_416 = const_418;
            }
            else
            {
               var_416 = const_384;
            }
         }
         else if(param1.length > 1)
         {
            var_416 = const_470;
         }
         else
         {
            var_416 = const_1144;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_416)
         {
            case const_418:
               var_415 = new SingleProductContainer(this,param1);
               break;
            case const_384:
               var_415 = new MultiProductContainer(this,param1);
               break;
            case const_470:
               var_415 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_416);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_897 > 0 && var_898 > 0)
         {
            var_598 = const_383;
         }
         else if(var_897 > 0)
         {
            var_598 = const_422;
         }
         else if(var_898 > 0)
         {
            var_598 = const_366;
         }
         else
         {
            var_598 = const_806;
         }
      }
   }
}
