package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1914:int;
      
      private var var_1913:Boolean;
      
      private var _offerId:int;
      
      private var var_1741:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1913 = param1.readBoolean();
         var_1914 = param1.readInteger();
         var_1741 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1741;
      }
      
      public function get monthsRequired() : int
      {
         return var_1914;
      }
      
      public function get isVip() : Boolean
      {
         return var_1913;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
