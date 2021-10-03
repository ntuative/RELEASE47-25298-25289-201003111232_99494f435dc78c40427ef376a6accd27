package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1059:int = -1;
      
      private static const const_757:int = 20;
      
      private static const const_490:int = 9;
       
      
      private var var_584:Boolean = false;
      
      private var var_220:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_220 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_584 = true;
            var_220 = new Array();
            var_220.push(const_1059);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_584)
            {
               var_584 = false;
               var_220 = new Array();
               var_220.push(const_757);
               var_220.push(const_490 + param1);
               var_220.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
