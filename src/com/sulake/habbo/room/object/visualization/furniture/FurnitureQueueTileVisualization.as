package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1102:int = 1;
      
      private static const const_1059:int = 3;
      
      private static const const_1101:int = 2;
      
      private static const const_1100:int = 15;
       
      
      private var var_892:int;
      
      private var var_220:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_220 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1101)
         {
            var_220 = new Array();
            var_220.push(const_1102);
            var_892 = const_1100;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_892 > 0)
         {
            --var_892;
         }
         if(var_892 == 0)
         {
            if(false)
            {
               super.setAnimation(var_220.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
