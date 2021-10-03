package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1868:String;
      
      private var var_1075:String;
      
      private var var_1867:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1867 = param1.readInteger();
         var_1868 = param1.readString();
         var_1075 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_1075;
      }
      
      public function get figureString() : String
      {
         return var_1868;
      }
      
      public function get slotId() : int
      {
         return var_1867;
      }
   }
}
