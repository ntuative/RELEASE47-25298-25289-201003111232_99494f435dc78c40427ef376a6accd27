package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_230:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_230 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_230;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_230 = new RoomSettingsFlatInfo();
         var_230.allowFurniMoving = param1.readInteger() == 1;
         var_230.doorMode = param1.readInteger();
         var_230.id = param1.readInteger();
         var_230.ownerName = param1.readString();
         var_230.type = param1.readString();
         var_230.name = param1.readString();
         var_230.description = param1.readString();
         var_230.showOwnerName = param1.readInteger() == 1;
         var_230.allowTrading = param1.readInteger() == 1;
         var_230.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
