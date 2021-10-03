package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.utils.ChildEntityArray;
   
   public class SkinTemplate extends ChildEntityArray implements ISkinTemplate
   {
       
      
      protected var _name:String;
      
      protected var var_757:IAsset;
      
      protected var var_622:Array;
      
      public function SkinTemplate(param1:String, param2:IAsset)
      {
         super();
         _name = param1;
         var_622 = new Array();
         var_757 = param2;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get id() : uint
      {
         return 0;
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:uint = this.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.removeChildAt(0);
            _loc2_++;
         }
         var_757 = null;
         var_622 = null;
         _name = null;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get asset() : IAsset
      {
         return var_757;
      }
   }
}
