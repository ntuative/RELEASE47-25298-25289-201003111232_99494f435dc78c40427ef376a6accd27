package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2138:Date;
      
      private var var_1304:Boolean = false;
      
      private var _type:int;
      
      private var var_366:BitmapData;
      
      private var var_272:Boolean = false;
      
      private var var_1303:int;
      
      private var var_597:int = 1;
      
      private var var_1064:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_366;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_597;
         if(var_597 < 0)
         {
            var_597 = 0;
         }
         var_1064 = var_1303;
         var_272 = false;
         var_1304 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1064 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_272;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_366 = param1;
      }
      
      public function get duration() : int
      {
         return var_1303;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1304;
      }
      
      public function get effectsInInventory() : int
      {
         return var_597;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_366;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_272)
         {
            var_2138 = new Date();
         }
         var_272 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_597 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_272)
         {
            _loc1_ = var_1064 - (new Date().valueOf() - var_2138.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1064;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1304 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1303 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
