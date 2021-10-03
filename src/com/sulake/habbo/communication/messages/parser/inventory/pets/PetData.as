package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PetData
   {
       
      
      private var var_563:String;
      
      private var _name:String;
      
      private var _type:int;
      
      private var _id:int;
      
      public function PetData(param1:IMessageDataWrapper)
      {
         super();
         _id = param1.readInteger();
         _name = param1.readString();
         var_563 = param1.readString();
         _type = param1.readInteger();
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_563;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}
