package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   
   public class GetGuestRoomResultMessageParser implements IMessageParser
   {
       
      
      private var _data:GuestRoomData;
      
      private var var_2292:Boolean;
      
      private var var_2291:Boolean;
      
      public function GetGuestRoomResultMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2291 = param1.readBoolean();
         this._data = new GuestRoomData(param1);
         this.var_2292 = param1.readBoolean();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get data() : GuestRoomData
      {
         return _data;
      }
      
      public function get roomForward() : Boolean
      {
         return var_2292;
      }
      
      public function get enterRoom() : Boolean
      {
         return var_2291;
      }
   }
}
