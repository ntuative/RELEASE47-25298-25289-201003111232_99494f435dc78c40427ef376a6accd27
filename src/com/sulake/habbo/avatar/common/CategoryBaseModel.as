package com.sulake.habbo.avatar.common
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   
   public class CategoryBaseModel
   {
       
      
      protected var var_15:Map;
      
      protected var var_13:HabboAvatarEditor;
      
      public function CategoryBaseModel(param1:HabboAvatarEditor)
      {
         super();
         var_13 = param1;
      }
      
      public function hasClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         if(!var_15)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in var_15)
         {
            _loc4_ = _loc3_.hasClubItemsOverLevel(param1);
            if(_loc4_)
            {
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function stripClubItemsOverLevel(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         if(!var_15)
         {
            return;
         }
         var _loc2_:Array = var_15.getKeys();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = var_15[_loc4_];
            _loc6_ = false;
            if(_loc5_.stripClubItemsOverLevel(param1))
            {
               _loc6_ = true;
            }
            if(_loc5_.stripClubColorsOverLevel(param1))
            {
               _loc6_ = true;
            }
            if(_loc6_)
            {
               _loc7_ = _loc5_.getCurrentPart();
               if(_loc7_ && var_13 && false && _loc5_)
               {
                  var_13.figureData.savePartData(_loc4_,_loc7_.id,_loc5_.getCurrentColorIds(),true);
               }
            }
            _loc3_++;
         }
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_15)
         {
            _loc1_.dispose();
         }
         var_15 = null;
      }
      
      public function dispose() : void
      {
         var_15 = null;
         var_13 = null;
      }
   }
}
