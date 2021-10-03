package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1466:int = 2;
      
      public static const const_1603:int = 1;
      
      public static const const_1486:int = 0;
       
      
      private var var_1146:int;
      
      private var var_368:int;
      
      private var var_2383:int;
      
      private var _offerId:int;
      
      private var var_1692:int;
      
      private var var_1607:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1607 = param2;
         var_1692 = param3;
         var_1146 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1607;
      }
      
      public function get furniType() : int
      {
         return var_1692;
      }
      
      public function get price() : int
      {
         return var_1146;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
