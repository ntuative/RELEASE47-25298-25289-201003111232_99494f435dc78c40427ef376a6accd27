package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_726:String = "RWOCM_CLUB_MAIN";
      
      public static const const_525:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1807:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_525);
         var_1807 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1807;
      }
   }
}
