package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_671:int = 2;
      
      public static const const_956:int = 6;
      
      public static const const_538:int = 1;
      
      public static const const_729:int = 3;
      
      public static const const_924:int = 4;
      
      public static const const_640:int = 5;
       
      
      private var var_2047:String;
      
      private var var_962:int;
      
      private var var_1753:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_962 = param2;
         var_1753 = param3;
         var_2047 = param4;
      }
      
      public function get time() : String
      {
         return var_2047;
      }
      
      public function get senderId() : int
      {
         return var_962;
      }
      
      public function get messageText() : String
      {
         return var_1753;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
