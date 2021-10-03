package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_981:Boolean;
      
      private var var_1215:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_981 = param1.readInteger() > 0;
         var_1215 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_981;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1215;
      }
      
      public function flush() : Boolean
      {
         var_981 = false;
         var_1215 = false;
         return true;
      }
   }
}
