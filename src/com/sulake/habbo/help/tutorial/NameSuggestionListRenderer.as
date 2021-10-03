package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.help.INameChangeUI;
   import flash.geom.Rectangle;
   
   public class NameSuggestionListRenderer
   {
       
      
      private var _rect:Rectangle = null;
      
      private const const_1607:int = 5;
      
      private const const_1608:int = 5;
      
      private var var_2306:int = 0;
      
      private var _offsetX:int;
      
      private var var_813:int;
      
      private var _main:INameChangeUI;
      
      public function NameSuggestionListRenderer(param1:INameChangeUI)
      {
         super();
         _main = param1;
      }
      
      private function createItem(param1:String) : ITextWindow
      {
         var _loc2_:ITextWindow = _main.method_1("tutorial_name_suggestion_item") as ITextWindow;
         if(_loc2_ == null)
         {
            return null;
         }
         _loc2_.text = param1;
         return _loc2_;
      }
      
      private function fit(param1:Rectangle) : Boolean
      {
         if(param1.width > _rect.width)
         {
            return false;
         }
         if(var_813 + param1.height > _rect.height)
         {
            return false;
         }
         if(_offsetX + param1.width > _rect.width)
         {
            _offsetX = 0;
            var_813 += param1.height + const_1608;
            return fit(param1);
         }
         param1.offset(_offsetX,var_813);
         _offsetX += param1.width + const_1607;
         return true;
      }
      
      public function render(param1:Array, param2:IWindowContainer) : int
      {
         var _loc3_:* = null;
         while(param2.removeChildAt(0) != null)
         {
         }
         var_2306 = 0;
         _offsetX = 0;
         var_813 = 0;
         _rect = param2.rectangle.clone();
         _rect.height = 150;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = createItem(param1[_loc4_] as String);
            if(fit(_loc3_.rectangle))
            {
               param2.addChild(_loc3_);
            }
            else
            {
               _loc3_.dispose();
            }
            _loc4_++;
         }
         var _loc5_:int = param2.numChildren;
         if(_loc5_ == 0)
         {
            return 0;
         }
         var _loc6_:IWindow = param2.getChildAt(param2.numChildren - 1);
         return _loc6_.rectangle.bottom;
      }
      
      public function dispose() : void
      {
         _main = null;
      }
   }
}
