package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.session.IRoomHandlerListener;
   
   public class BaseHandler implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      public var _xxxRoomId:int;
      
      public var var_37:int;
      
      private var var_112:IRoomHandlerListener;
      
      private var _connection:IConnection;
      
      public function BaseHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super();
         _connection = param1;
         var_112 = param2;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function get listener() : IRoomHandlerListener
      {
         return var_112;
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_112 = null;
         _disposed = true;
      }
   }
}
