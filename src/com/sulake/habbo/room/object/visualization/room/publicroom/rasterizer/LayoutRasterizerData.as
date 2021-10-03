package com.sulake.habbo.room.object.visualization.room.publicroom.rasterizer
{
   public class LayoutRasterizerData
   {
       
      
      private var var_1237:XMLList;
      
      public function LayoutRasterizerData(param1:XML)
      {
         super();
         var_1237 = param1.elements.element;
      }
      
      public function get elementList() : XMLList
      {
         return var_1237;
      }
      
      public function dispose() : void
      {
         var_1237 = null;
      }
   }
}
