package com.sulake.habbo.avatar.palette
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.UnknownAsset;
   import com.sulake.core.assets.XmlAsset;
   import flash.utils.ByteArray;
   
   public class PaletteManager
   {
       
      
      private var var_1052:Array;
      
      public function PaletteManager(param1:AssetLibraryCollection, param2:Array)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         super();
         var_1052 = new Array();
         for each(_loc3_ in param2)
         {
            _loc4_ = param1.getAssetLibraryByName(_loc3_);
            if(_loc4_ != null)
            {
               if(_loc4_.hasAsset("petPalettesConfiguration"))
               {
                  _loc5_ = (_loc4_.getAssetByName("petPalettesConfiguration") as XmlAsset).content as XML;
                  for each(_loc6_ in _loc5_.palette)
                  {
                     _loc7_ = parseInt(_loc6_.@id);
                     _loc8_ = String(_loc6_.@asset);
                     _loc9_ = _loc4_.getAssetByName(_loc8_) as UnknownAsset;
                     if(_loc9_ != null)
                     {
                        if(_loc9_.content is Class)
                        {
                           _loc10_ = new _loc9_.content() as ByteArray;
                        }
                        else
                        {
                           _loc10_ = _loc9_.content as ByteArray;
                        }
                        _loc11_ = new PaletteMap(_loc10_);
                        var_1052[_loc7_] = _loc11_;
                     }
                  }
               }
            }
         }
      }
      
      private function paletteTest() : void
      {
      }
      
      public function getPalette(param1:int) : PaletteMap
      {
         return var_1052[param1];
      }
   }
}
