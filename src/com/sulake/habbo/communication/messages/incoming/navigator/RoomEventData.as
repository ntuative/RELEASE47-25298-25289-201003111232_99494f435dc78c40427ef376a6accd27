package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2016:String;
      
      private var var_437:int;
      
      private var var_2107:String;
      
      private var var_2103:String;
      
      private var var_2105:int;
      
      private var var_2104:String;
      
      private var var_2106:int;
      
      private var var_622:Array;
      
      private var var_1018:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_622 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1018 = false;
            return;
         }
         this.var_1018 = true;
         var_2105 = int(_loc2_);
         var_2107 = param1.readString();
         var_437 = int(param1.readString());
         var_2106 = param1.readInteger();
         var_2016 = param1.readString();
         var_2103 = param1.readString();
         var_2104 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_622.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2106;
      }
      
      public function get eventName() : String
      {
         return var_2016;
      }
      
      public function get eventDescription() : String
      {
         return var_2103;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2107;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get creationTime() : String
      {
         return var_2104;
      }
      
      public function get exists() : Boolean
      {
         return var_1018;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2105;
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
         this.var_622 = null;
      }
      
      public function get flatId() : int
      {
         return var_437;
      }
   }
}
