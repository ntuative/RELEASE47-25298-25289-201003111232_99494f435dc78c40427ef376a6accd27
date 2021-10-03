package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_201:String = "e";
      
      public static const const_77:String = "i";
      
      public static const const_79:String = "s";
       
      
      private var var_949:String;
      
      private var var_1129:String;
      
      private var var_1127:int;
      
      private var var_1961:int;
      
      private var var_948:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1129 = param1.readString();
         var_1961 = param1.readInteger();
         var_949 = param1.readString();
         var_948 = param1.readInteger();
         var_1127 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_948;
      }
      
      public function get productType() : String
      {
         return var_1129;
      }
      
      public function get expiration() : int
      {
         return var_1127;
      }
      
      public function get furniClassId() : int
      {
         return var_1961;
      }
      
      public function get extraParam() : String
      {
         return var_949;
      }
   }
}
