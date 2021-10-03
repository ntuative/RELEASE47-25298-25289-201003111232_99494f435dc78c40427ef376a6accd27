package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1780:int;
      
      private var var_2188:String;
      
      private var var_2186:int;
      
      private var var_2184:int;
      
      private var var_637:Boolean;
      
      private var var_1830:Boolean;
      
      private var var_437:int;
      
      private var var_1112:String;
      
      private var var_1828:int;
      
      private var var_1327:int;
      
      private var _ownerName:String;
      
      private var var_668:String;
      
      private var var_2185:int;
      
      private var var_2187:RoomThumbnailData;
      
      private var var_2077:Boolean;
      
      private var var_622:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_622 = new Array();
         super();
         var_437 = param1.readInteger();
         var_637 = param1.readBoolean();
         var_668 = param1.readString();
         _ownerName = param1.readString();
         var_1828 = param1.readInteger();
         var_1780 = param1.readInteger();
         var_2185 = param1.readInteger();
         var_1112 = param1.readString();
         var_2186 = param1.readInteger();
         var_2077 = param1.readBoolean();
         var_2184 = param1.readInteger();
         var_1327 = param1.readInteger();
         var_2188 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_622.push(_loc4_);
            _loc3_++;
         }
         var_2187 = new RoomThumbnailData(param1);
         var_1830 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2185;
      }
      
      public function get roomName() : String
      {
         return var_668;
      }
      
      public function get userCount() : int
      {
         return var_1780;
      }
      
      public function get score() : int
      {
         return var_2184;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2188;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2077;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1830;
      }
      
      public function get event() : Boolean
      {
         return var_637;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1327;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2186;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2187;
      }
      
      public function get doorMode() : int
      {
         return var_1828;
      }
      
      public function get flatId() : int
      {
         return var_437;
      }
      
      public function get description() : String
      {
         return var_1112;
      }
   }
}
