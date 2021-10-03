package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRedeemClubPromoMessage extends RoomWidgetMessage
   {
      
      public static const const_562:String = "rwrcp_redeem_club_promo";
       
      
      private var var_1791:String;
      
      private var var_1790:Boolean;
      
      public function RoomWidgetRedeemClubPromoMessage(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         var_1791 = param2;
         var_1790 = param3;
      }
      
      public function get code() : String
      {
         return var_1791;
      }
      
      public function get isTrial() : Boolean
      {
         return var_1790;
      }
   }
}
