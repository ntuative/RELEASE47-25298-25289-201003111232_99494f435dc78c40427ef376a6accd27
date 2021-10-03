package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1926:int;
      
      private var var_1927:String;
      
      private var var_1901:int;
      
      private var _disposed:Boolean;
      
      private var var_1925:int;
      
      private var var_1900:String;
      
      private var var_1149:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1900 = param1.readString();
         var_1926 = param1.readInteger();
         var_1901 = param1.readInteger();
         var_1927 = param1.readString();
         var_1925 = param1.readInteger();
         var_1149 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1925;
      }
      
      public function get worldId() : int
      {
         return var_1901;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1900;
      }
      
      public function get unitPort() : int
      {
         return var_1926;
      }
      
      public function get castLibs() : String
      {
         return var_1927;
      }
      
      public function get nodeId() : int
      {
         return var_1149;
      }
   }
}
