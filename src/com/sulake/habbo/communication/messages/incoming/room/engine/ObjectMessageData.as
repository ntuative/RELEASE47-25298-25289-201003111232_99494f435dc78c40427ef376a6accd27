package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_990:int = 0;
      
      private var _data:String = "";
      
      private var var_1401:int = -1;
      
      private var var_35:int = 0;
      
      private var _type:int = 0;
      
      private var var_989:int = 0;
      
      private var var_2368:String = "";
      
      private var var_1952:int = 0;
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_215:int = 0;
      
      private var var_1953:String = null;
      
      private var var_87:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_215;
      }
      
      public function get extra() : int
      {
         return var_1401;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_215 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_87 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_205)
         {
            var_1401 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_205)
         {
            var_35 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1952;
      }
      
      public function get staticClass() : String
      {
         return var_1953;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_205)
         {
            var_1952 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_205)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_205)
         {
            var_1953 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_205)
         {
            var_990 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_205)
         {
            var_989 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_86 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_990;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get sizeY() : int
      {
         return var_989;
      }
   }
}
