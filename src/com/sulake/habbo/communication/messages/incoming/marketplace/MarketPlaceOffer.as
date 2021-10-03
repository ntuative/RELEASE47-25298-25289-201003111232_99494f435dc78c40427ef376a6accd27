package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1146:int;
      
      private var var_1691:int = -1;
      
      private var var_368:int;
      
      private var var_1690:int;
      
      private var var_1692:int;
      
      private var _offerId:int;
      
      private var var_1145:int;
      
      private var var_1607:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1607 = param2;
         var_1692 = param3;
         var_1146 = param4;
         var_368 = param5;
         var_1691 = param6;
         var_1690 = param7;
         var_1145 = param8;
      }
      
      public function get status() : int
      {
         return var_368;
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
      
      public function get averagePrice() : int
      {
         return var_1690;
      }
      
      public function get furniId() : int
      {
         return var_1607;
      }
   }
}
