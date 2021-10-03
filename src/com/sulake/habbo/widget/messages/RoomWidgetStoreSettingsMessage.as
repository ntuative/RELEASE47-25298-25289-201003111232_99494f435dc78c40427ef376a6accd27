package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_579:String = "RWSSM_STORE_SOUND";
      
      public static const const_638:String = "RWSSM_PREVIEW_SOUND";
      
      public static const const_1348:String = "RWSSM_STORE_SETTINGS";
       
      
      private var var_729:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function set volume(param1:Number) : void
      {
         var_729 = param1;
      }
      
      public function get volume() : Number
      {
         return var_729;
      }
   }
}
