package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      private var var_215:int = 0;
      
      private var var_1761:int = 0;
      
      private var var_2171:Number = 0;
      
      private var var_2174:Number = 0;
      
      private var var_2172:Number = 0;
      
      private var var_2173:Number = 0;
      
      private var var_2175:Boolean = false;
      
      private var var_87:Number = 0;
      
      private var _id:int = 0;
      
      private var var_188:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_188 = [];
         super();
         _id = param1;
         var_87 = param2;
         _y = param3;
         var_86 = param4;
         var_2173 = param5;
         var_215 = param6;
         var_1761 = param7;
         var_2171 = param8;
         var_2174 = param9;
         var_2172 = param10;
         var_2175 = param11;
         var_188 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get dir() : int
      {
         return var_215;
      }
      
      public function get localZ() : Number
      {
         return var_2173;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2175;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1761;
      }
      
      public function get targetX() : Number
      {
         return var_2171;
      }
      
      public function get targetY() : Number
      {
         return var_2174;
      }
      
      public function get targetZ() : Number
      {
         return var_2172;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get actions() : Array
      {
         return var_188.slice();
      }
   }
}
