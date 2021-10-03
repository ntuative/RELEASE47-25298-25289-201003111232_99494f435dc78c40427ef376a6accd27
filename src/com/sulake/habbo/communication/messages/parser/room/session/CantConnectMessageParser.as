package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1528:int = 2;
      
      public static const const_331:int = 4;
      
      public static const const_1135:int = 1;
      
      public static const const_1340:int = 3;
       
      
      private var var_952:int = 0;
      
      private var var_760:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_952;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_952 = param1.readInteger();
         if(var_952 == 3)
         {
            var_760 = param1.readString();
         }
         else
         {
            var_760 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_952 = 0;
         var_760 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_760;
      }
   }
}
