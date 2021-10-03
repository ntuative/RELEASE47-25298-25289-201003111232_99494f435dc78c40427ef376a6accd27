package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_563:String;
      
      private var var_2325:String;
      
      private var var_2328:int;
      
      private var var_2326:int;
      
      private var var_1317:String;
      
      private var var_1326:String;
      
      private var _name:String;
      
      private var var_483:int;
      
      private var var_815:int;
      
      private var var_2329:int;
      
      private var var_1849:int;
      
      private var var_2327:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2326;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1326;
      }
      
      public function get customData() : String
      {
         return this.var_2325;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_483;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2328;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2327;
      }
      
      public function get figure() : String
      {
         return this.var_563;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1849;
      }
      
      public function get sex() : String
      {
         return this.var_1317;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_563 = param1.readString();
         this.var_1317 = param1.readString();
         this.var_2325 = param1.readString();
         this.var_1326 = param1.readString();
         this.var_2329 = param1.readInteger();
         this.var_2327 = param1.readString();
         this.var_2328 = param1.readInteger();
         this.var_2326 = param1.readInteger();
         this.var_1849 = param1.readInteger();
         this.var_815 = param1.readInteger();
         this.var_483 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2329;
      }
      
      public function get respectLeft() : int
      {
         return this.var_815;
      }
   }
}
