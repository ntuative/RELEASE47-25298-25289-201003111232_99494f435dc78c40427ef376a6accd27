package com.sulake.habbo.communication.messages.outgoing.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class ChangeUserNameMessageComposer implements IMessageComposer
   {
       
      
      private var _data:Array;
      
      public function ChangeUserNameMessageComposer(param1:String)
      {
         super();
         _data = new Array();
         _data.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return _data;
      }
      
      public function dispose() : void
      {
         _data = null;
      }
   }
}
