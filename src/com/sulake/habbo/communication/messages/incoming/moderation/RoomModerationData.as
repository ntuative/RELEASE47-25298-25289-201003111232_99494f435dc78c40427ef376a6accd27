package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_115:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1780:int;
      
      private var var_437:int;
      
      private var var_637:RoomData;
      
      private var var_1625:int;
      
      private var _ownerName:String;
      
      private var var_2201:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_437 = param1.readInteger();
         var_1780 = param1.readInteger();
         var_2201 = param1.readBoolean();
         var_1625 = param1.readInteger();
         _ownerName = param1.readString();
         var_115 = new RoomData(param1);
         var_637 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1780;
      }
      
      public function get event() : RoomData
      {
         return var_637;
      }
      
      public function get room() : RoomData
      {
         return var_115;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_115 != null)
         {
            var_115.dispose();
            var_115 = null;
         }
         if(var_637 != null)
         {
            var_637.dispose();
            var_637 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_437;
      }
      
      public function get ownerId() : int
      {
         return var_1625;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2201;
      }
   }
}
