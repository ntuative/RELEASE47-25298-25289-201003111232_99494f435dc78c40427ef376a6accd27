package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1139:String = "F";
      
      public static const const_841:String = "M";
       
      
      private var var_87:Number = 0;
      
      private var var_563:String = "";
      
      private var var_2254:int = 0;
      
      private var var_1940:String = "";
      
      private var var_1938:int = 0;
      
      private var var_1937:int = 0;
      
      private var var_1936:String = "";
      
      private var var_1317:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_215:int = 0;
      
      private var var_2253:String = "";
      
      private var _name:String = "";
      
      private var var_1939:int = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_215;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_215 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_205)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2254;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_205)
         {
            var_1938 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2253;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_205)
         {
            var_1936 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_205)
         {
            var_2253 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_205)
         {
            var_1937 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_205)
         {
            var_563 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_205)
         {
            var_2254 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_205)
         {
            var_1317 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1938;
      }
      
      public function get groupID() : String
      {
         return var_1936;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_205)
         {
            var_1939 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_205)
         {
            var_1940 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get sex() : String
      {
         return var_1317;
      }
      
      public function get figure() : String
      {
         return var_563;
      }
      
      public function get webID() : int
      {
         return var_1939;
      }
      
      public function get custom() : String
      {
         return var_1940;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_86 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_87 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1937;
      }
   }
}
