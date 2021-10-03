package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var var_1414:uint;
      
      private var _rgb:uint;
      
      private var _index:int;
      
      private var var_1417:Number;
      
      private var _b:uint;
      
      private var var_1418:Number;
      
      private var var_1416:uint;
      
      private var var_1742:int;
      
      private var var_1415:Number;
      
      private var _colorTransform:ColorTransform;
      
      private var _id:int;
      
      private var var_1741:Boolean = false;
      
      public function PartColor(param1:XML)
      {
         super();
         _id = parseInt(param1.@id);
         _index = parseInt(param1.@index);
         var_1742 = parseInt(param1.@club);
         var_1741 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         _rgb = parseInt(_loc2_,16);
         var_1414 = _rgb >> 16 & 255;
         var_1416 = _rgb >> 8 & 255;
         _b = _rgb >> 0 & 255;
         var_1415 = var_1414 / 255 * 1;
         var_1418 = var_1416 / 255 * 1;
         var_1417 = _b / 255 * 1;
         _colorTransform = new ColorTransform(var_1415,var_1418,var_1417);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return _rgb;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get blueMultiplier() : Number
      {
         return var_1417;
      }
      
      public function get r() : uint
      {
         return var_1414;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1741;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get greenMultiplier() : Number
      {
         return var_1418;
      }
      
      public function get g() : uint
      {
         return var_1416;
      }
      
      public function get redMultiplier() : Number
      {
         return var_1415;
      }
      
      public function get clubLevel() : int
      {
         return var_1742;
      }
   }
}
