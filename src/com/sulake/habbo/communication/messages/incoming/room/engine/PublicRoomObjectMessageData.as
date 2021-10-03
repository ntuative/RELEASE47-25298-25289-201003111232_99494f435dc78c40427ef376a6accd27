package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_989:int = 0;
      
      private var var_86:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_205:Boolean = false;
      
      private var var_215:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_87:Number = 0;
      
      private var var_990:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_86 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_989;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_215;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_205)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_215 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_205)
         {
            var_989 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_205)
         {
            var_990 = param1;
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
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_990;
      }
   }
}
