package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1466:String;
      
      private var var_1876:int;
      
      private var var_1878:int;
      
      private var var_1877:int;
      
      private var var_1875:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1876 = param1.readInteger();
         var_1877 = param1.readInteger();
         var_1878 = param1.readInteger();
         var_1875 = param1.readString();
         var_1466 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1466;
      }
      
      public function get hour() : int
      {
         return var_1876;
      }
      
      public function get minute() : int
      {
         return var_1877;
      }
      
      public function get chatterName() : String
      {
         return var_1875;
      }
      
      public function get chatterId() : int
      {
         return var_1878;
      }
   }
}
