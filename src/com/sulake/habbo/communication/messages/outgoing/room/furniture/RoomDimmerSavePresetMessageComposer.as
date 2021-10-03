package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1888:int;
      
      private var var_1887:int;
      
      private var var_1965:Boolean;
      
      private var var_1966:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1964:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1887 = param1;
         var_1888 = param2;
         var_1966 = param3;
         var_1964 = param4;
         var_1965 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1887,var_1888,var_1966,var_1964,int(var_1965)];
      }
      
      public function dispose() : void
      {
      }
   }
}
