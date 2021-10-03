package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2284:Boolean;
      
      private var var_2283:int;
      
      private var var_2282:Boolean;
      
      private var var_1487:String;
      
      private var var_1326:String;
      
      private var var_1765:int;
      
      private var var_1951:String;
      
      private var var_2281:String;
      
      private var var_1950:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1765 = param1.readInteger();
         this.var_1487 = param1.readString();
         this.var_1951 = param1.readString();
         this.var_2284 = param1.readBoolean();
         this.var_2282 = param1.readBoolean();
         param1.readString();
         this.var_2283 = param1.readInteger();
         this.var_1950 = param1.readString();
         this.var_2281 = param1.readString();
         this.var_1326 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1326;
      }
      
      public function get avatarName() : String
      {
         return this.var_1487;
      }
      
      public function get avatarId() : int
      {
         return this.var_1765;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2284;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2281;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1950;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2282;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1951;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2283;
      }
   }
}
