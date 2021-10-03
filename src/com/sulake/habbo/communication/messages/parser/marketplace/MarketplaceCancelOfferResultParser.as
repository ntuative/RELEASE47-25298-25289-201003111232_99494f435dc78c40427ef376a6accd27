package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceCancelOfferResultParser implements IMessageParser
   {
       
      
      private var _result:int;
      
      private var _offerId:int;
      
      public function MarketplaceCancelOfferResultParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _offerId = param1.readInteger();
         _result = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get result() : int
      {
         return _result;
      }
   }
}
