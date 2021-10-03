package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1187:int = 4;
      
      public static const const_590:int = 3;
      
      public static const const_682:int = 2;
      
      public static const const_984:int = 1;
       
      
      private var var_1778:String;
      
      private var _disposed:Boolean;
      
      private var var_1780:int;
      
      private var var_1781:Boolean;
      
      private var var_800:String;
      
      private var var_792:PublicRoomData;
      
      private var var_1782:int;
      
      private var _index:int;
      
      private var var_1777:String;
      
      private var _type:int;
      
      private var var_1743:String;
      
      private var var_793:GuestRoomData;
      
      private var var_1779:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1778 = param1.readString();
         var_1779 = param1.readString();
         var_1781 = param1.readInteger() == 1;
         var_1777 = param1.readString();
         var_800 = param1.readString();
         var_1782 = param1.readInteger();
         var_1780 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_984)
         {
            var_1743 = param1.readString();
         }
         else if(_type == const_590)
         {
            var_792 = new PublicRoomData(param1);
         }
         else if(_type == const_682)
         {
            var_793 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1782;
      }
      
      public function get popupCaption() : String
      {
         return var_1778;
      }
      
      public function get userCount() : int
      {
         return var_1780;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1781;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_984)
         {
            return 0;
         }
         if(this.type == const_682)
         {
            return this.var_793.maxUserCount;
         }
         if(this.type == const_590)
         {
            return this.var_792.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1779;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_793 != null)
         {
            this.var_793.dispose();
            this.var_793 = null;
         }
         if(this.var_792 != null)
         {
            this.var_792.dispose();
            this.var_792 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_793;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1777;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_792;
      }
      
      public function get picRef() : String
      {
         return var_800;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1743;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
