package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_1693:int;
      
      private var var_1146:int;
      
      private var var_1690:int;
      
      private var var_1691:int = -1;
      
      private var var_368:int;
      
      private var var_1692:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1145:int;
      
      private var var_1607:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = -1)
      {
         super();
         _offerId = param1;
         var_1607 = param2;
         var_1692 = param3;
         var_1146 = param4;
         var_368 = param5;
         var_1690 = param6;
         var_1145 = param7;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_1693 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_1693;
      }
      
      public function get price() : int
      {
         return var_1146;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1691;
      }
      
      public function get offerCount() : int
      {
         return var_1145;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1692;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1691 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1146 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1145 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get status() : int
      {
         return var_368;
      }
      
      public function get averagePrice() : int
      {
         return var_1690;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1;
      }
      
      public function get furniId() : int
      {
         return var_1607;
      }
   }
}
