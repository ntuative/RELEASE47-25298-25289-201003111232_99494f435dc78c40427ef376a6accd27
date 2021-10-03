package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_583:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_508:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_583);
         var_508 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_508;
      }
   }
}
