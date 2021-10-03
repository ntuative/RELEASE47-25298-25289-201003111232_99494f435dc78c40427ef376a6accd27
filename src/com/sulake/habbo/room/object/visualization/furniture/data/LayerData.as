package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_441:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_472:int = 0;
      
      public static const const_928:int = 2;
      
      public static const const_993:int = 1;
      
      public static const const_684:Boolean = false;
      
      public static const const_611:String = "";
      
      public static const const_440:int = 0;
      
      public static const const_474:int = 0;
      
      public static const const_390:int = 0;
       
      
      private var var_2082:int = 0;
      
      private var var_1743:String = "";
      
      private var var_1583:int = 0;
      
      private var var_2083:int = 0;
      
      private var var_2084:Number = 0;
      
      private var var_1785:int = 255;
      
      private var var_2081:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_2082;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1583 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_2084;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_2083 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_2082 = param1;
      }
      
      public function get tag() : String
      {
         return var_1743;
      }
      
      public function get alpha() : int
      {
         return var_1785;
      }
      
      public function get ink() : int
      {
         return var_1583;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_2084 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_2083;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_2081 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_2081;
      }
      
      public function set tag(param1:String) : void
      {
         var_1743 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1785 = param1;
      }
   }
}
