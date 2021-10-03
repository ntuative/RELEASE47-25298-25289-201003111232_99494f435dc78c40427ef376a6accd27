package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1069:Boolean;
      
      private var var_1070:Boolean;
      
      private var var_1068:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1069;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1070;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1068 = param1.readBoolean();
         var_1070 = param1.readBoolean();
         var_1069 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1068;
      }
      
      public function flush() : Boolean
      {
         var_1068 = false;
         var_1070 = false;
         var_1069 = false;
         return true;
      }
   }
}
