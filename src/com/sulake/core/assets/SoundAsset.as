package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var var_21:Sound = null;
      
      private var _disposed:Boolean = false;
      
      private var var_1139:AssetTypeDeclaration;
      
      private var var_935:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1139 = param1;
         var_935 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1139;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return var_935;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Sound)
         {
            if(var_21)
            {
               var_21.close();
            }
            var_21 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(var_21)
            {
               var_21.close();
            }
            var_21 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(var_21)
            {
               var_21.close();
            }
            var_21 = SoundAsset(param1).var_21;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_21 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            var_21 = SoundAsset(param1).var_21;
         }
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
   }
}
