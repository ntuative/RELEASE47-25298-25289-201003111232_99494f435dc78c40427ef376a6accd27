package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_563:String;
      
      private var var_1328:String;
      
      private var var_1325:String;
      
      private var var_1327:int;
      
      private var var_1075:int;
      
      private var var_1326:String;
      
      private var _name:String;
      
      private var var_1241:Boolean;
      
      private var var_684:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1075 = param1.readInteger();
         this.var_684 = param1.readBoolean();
         this.var_1241 = param1.readBoolean();
         this.var_563 = param1.readString();
         this.var_1327 = param1.readInteger();
         this.var_1325 = param1.readString();
         this.var_1328 = param1.readString();
         this.var_1326 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_1075;
      }
      
      public function get realName() : String
      {
         return var_1326;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1325;
      }
      
      public function get categoryId() : int
      {
         return var_1327;
      }
      
      public function get online() : Boolean
      {
         return var_684;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1241;
      }
      
      public function get lastAccess() : String
      {
         return var_1328;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_563;
      }
   }
}
