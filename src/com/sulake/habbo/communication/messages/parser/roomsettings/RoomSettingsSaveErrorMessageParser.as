package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1451:int = 9;
      
      public static const const_1587:int = 4;
      
      public static const const_1450:int = 1;
      
      public static const const_1284:int = 10;
      
      public static const const_1459:int = 2;
      
      public static const const_1288:int = 7;
      
      public static const const_1216:int = 11;
      
      public static const const_1529:int = 3;
      
      public static const const_1200:int = 8;
      
      public static const const_1270:int = 5;
      
      public static const const_1555:int = 6;
      
      public static const const_1375:int = 12;
       
      
      private var var_2068:String;
      
      private var _roomId:int;
      
      private var var_1187:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2068;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1187 = param1.readInteger();
         var_2068 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1187;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
