package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1058:int = 31;
      
      private static const const_1059:int = 32;
      
      private static const const_489:int = 30;
      
      private static const const_757:int = 20;
      
      private static const const_490:int = 10;
       
      
      private var var_584:Boolean = false;
      
      private var var_220:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_220 = new Array();
         super();
         super.setAnimation(const_489);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_584 = true;
            var_220 = new Array();
            var_220.push(const_1058);
            var_220.push(const_1059);
            return;
         }
         if(param1 > 0 && param1 <= const_490)
         {
            if(var_584)
            {
               var_584 = false;
               var_220 = new Array();
               if(_direction == 2)
               {
                  var_220.push(const_757 + 5 - param1);
                  var_220.push(const_490 + 5 - param1);
               }
               else
               {
                  var_220.push(const_757 + param1);
                  var_220.push(const_490 + param1);
               }
               var_220.push(const_489);
               return;
            }
            super.setAnimation(const_489);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
