package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_742:IAssetLoader;
      
      private var var_1202:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1202 = param1;
         var_742 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_742;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_742 != null)
            {
               if(true)
               {
                  var_742.dispose();
                  var_742 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1202;
      }
   }
}
