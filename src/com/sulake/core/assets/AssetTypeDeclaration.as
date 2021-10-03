package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2247:Class;
      
      private var var_2246:Class;
      
      private var var_2245:String;
      
      private var var_1359:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2245 = param1;
         var_2246 = param2;
         var_2247 = param3;
         if(rest == null)
         {
            var_1359 = new Array();
         }
         else
         {
            var_1359 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2247;
      }
      
      public function get assetClass() : Class
      {
         return var_2246;
      }
      
      public function get mimeType() : String
      {
         return var_2245;
      }
      
      public function get fileTypes() : Array
      {
         return var_1359;
      }
   }
}
