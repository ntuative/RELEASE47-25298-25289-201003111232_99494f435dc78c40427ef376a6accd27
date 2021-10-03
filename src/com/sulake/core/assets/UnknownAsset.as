package com.sulake.core.assets
{
   import flash.utils.getQualifiedClassName;
   
   public class UnknownAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1139:AssetTypeDeclaration;
      
      private var var_935:String;
      
      private var var_21:Object = null;
      
      public function UnknownAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1139 = param1;
         var_935 = param2;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1139;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var_21 = param1;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         var_21 = param1.content as Object;
      }
      
      public function get content() : Object
      {
         return var_21;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_21 = null;
            var_1139 = null;
            var_935 = null;
         }
      }
      
      public function get url() : String
      {
         return var_935;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + var_21;
      }
   }
}
