package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2036:int;
      
      private var var_2037:String;
      
      private var var_1467:IActionDefinition;
      
      private var var_2041:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2039:String;
      
      private var var_2040:String;
      
      private var var_1917:Boolean;
      
      private var var_2038:ColorTransform;
      
      private var var_2035:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2037 = param1;
         var_2039 = param2;
         var_2036 = param3;
         _color = param4;
         _frames = param5;
         var_1467 = param6;
         var_1917 = param7;
         var_2035 = param8;
         var_2040 = param9;
         var_2041 = param10;
         var_2038 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1917;
      }
      
      public function get partType() : String
      {
         return var_2039;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2035;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2041;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2036;
      }
      
      public function get flippedPartType() : String
      {
         return var_2040;
      }
      
      public function get bodyPartId() : String
      {
         return var_2037;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1467;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2038;
      }
   }
}
