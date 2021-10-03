package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_151:int;
      
      private var var_215:int = 0;
      
      private var _roomId:int;
      
      private var var_87:int = 0;
      
      private var _y:int = 0;
      
      private var var_1712:int;
      
      private var var_2176:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_151 = param1;
         var_1712 = param2;
         var_2176 = param3;
         var_87 = param4;
         _y = param5;
         var_215 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1712)
         {
            case RoomObjectCategoryEnum.const_31:
               return [var_151 + " " + var_87 + " " + _y + " " + var_215];
            case RoomObjectCategoryEnum.const_30:
               return [var_151 + " " + var_2176];
            default:
               return [];
         }
      }
   }
}
