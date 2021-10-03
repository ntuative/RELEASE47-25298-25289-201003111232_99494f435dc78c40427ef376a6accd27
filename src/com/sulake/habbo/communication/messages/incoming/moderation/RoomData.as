package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var _name:String;
      
      private var _desc:String;
      
      private var var_622:Array;
      
      private var var_1018:Boolean;
      
      public function RoomData(param1:IMessageDataWrapper)
      {
         var_622 = new Array();
         super();
         var_1018 = param1.readBoolean();
         if(!exists)
         {
            return;
         }
         _name = param1.readString();
         _desc = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_622.push(param1.readString());
            _loc3_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get desc() : String
      {
         return _desc;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get exists() : Boolean
      {
         return var_1018;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_622 = null;
      }
   }
}
