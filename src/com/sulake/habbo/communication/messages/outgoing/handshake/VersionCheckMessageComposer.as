package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2005:String;
      
      private var var_1177:String;
      
      private var var_2006:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2006 = param1;
         var_1177 = param2;
         var_2005 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2006,var_1177,var_2005];
      }
      
      public function dispose() : void
      {
      }
   }
}
