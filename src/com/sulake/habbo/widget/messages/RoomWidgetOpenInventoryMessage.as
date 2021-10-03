package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_938:String = "inventory_badges";
      
      public static const const_1304:String = "inventory_clothes";
      
      public static const const_1373:String = "inventory_furniture";
      
      public static const const_710:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_892:String = "inventory_effects";
       
      
      private var var_1975:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_710);
         var_1975 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1975;
      }
   }
}
