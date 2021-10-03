package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2002:int;
      
      private var var_996:int;
      
      private var var_2001:int;
      
      private var var_1502:int;
      
      private var var_115:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1502 = param1.readInteger();
         var_2001 = param1.readInteger();
         var_996 = param1.readInteger();
         var_2002 = param1.readInteger();
         var_115 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1502);
      }
      
      public function get chatRecordId() : int
      {
         return var_2002;
      }
      
      public function get reportedUserId() : int
      {
         return var_996;
      }
      
      public function get callerUserId() : int
      {
         return var_2001;
      }
      
      public function get callId() : int
      {
         return var_1502;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_115;
      }
   }
}
