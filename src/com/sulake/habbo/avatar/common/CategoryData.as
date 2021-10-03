package com.sulake.habbo.avatar.common
{
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   
   public class CategoryData
   {
       
      
      private var _data:Array;
      
      private var var_62:Array;
      
      private var var_688:int = -1;
      
      private var _selectedColorLayerIndex:int;
      
      private var _palette:Array;
      
      public function CategoryData(param1:Array, param2:Array)
      {
         super();
         _data = param1;
         _palette = param2;
         var_62 = new Array();
         _selectedColorLayerIndex = 0;
      }
      
      public function hasClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:Boolean = false;
         var _loc3_:Array = getCurrentColors();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc7_ = _loc3_[_loc4_];
            if(_loc7_.clubLevel > param1)
            {
               _loc2_ = true;
            }
            _loc4_++;
         }
         var _loc5_:Boolean = false;
         var _loc6_:AvatarEditorGridPartItem = getCurrentPart();
         if(_loc6_ && _loc6_.partSet)
         {
            _loc8_ = _loc6_.partSet;
            if(_loc8_.clubLevel > param1)
            {
               _loc5_ = true;
            }
         }
         return _loc2_ || _loc5_;
      }
      
      public function selectItemId(param1:int) : void
      {
         var _loc3_:* = null;
         if(!_data)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _data.length)
         {
            _loc3_ = _data[_loc2_];
            if(_loc3_.id == param1)
            {
               selectItemIndex(_loc2_);
               return;
            }
            _loc2_++;
         }
      }
      
      public function selectColorIndex(param1:int) : AvatarEditorGridColorItem
      {
         var _loc2_:* = null;
         if(!var_62)
         {
            return null;
         }
         if(var_62.length <= _selectedColorLayerIndex)
         {
            return null;
         }
         if(!_palette)
         {
            return null;
         }
         if(_palette.length < param1)
         {
            return null;
         }
         clearAllColorSelections();
         var_62[_selectedColorLayerIndex] = param1;
         _loc2_ = _palette[param1] as AvatarEditorGridColorItem;
         if(_loc2_)
         {
            _loc2_.isSelected = true;
         }
         updateItemColors();
         return _loc2_;
      }
      
      private function updateItemColors() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = getCurrentColors();
         for each(_loc2_ in _data)
         {
            if(_loc2_)
            {
               _loc2_.colors = _loc1_;
            }
         }
      }
      
      public function getColorLayerIndex() : int
      {
         return _selectedColorLayerIndex;
      }
      
      private function getCurrentColors() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < var_62.length)
         {
            _loc2_ = getCurrentColor(_loc3_);
            if(_loc2_)
            {
               _loc1_.push(_loc2_.partColor);
            }
            else
            {
               _loc1_.push(null);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getCurrentPart() : AvatarEditorGridPartItem
      {
         return _data[var_688] as AvatarEditorGridPartItem;
      }
      
      public function getCurrentColorId(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 > -1)
         {
            _loc2_ = param1;
         }
         else
         {
            _loc2_ = _selectedColorLayerIndex;
         }
         if(var_62.length <= _loc2_)
         {
            return -1;
         }
         var _loc3_:AvatarEditorGridColorItem = _palette["null"] as AvatarEditorGridColorItem;
         if(_loc3_ && _loc3_.partColor)
         {
            return _loc3_.partColor.id;
         }
         return -1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_data)
         {
            for each(_loc1_ in _data)
            {
               _loc1_.dispose();
            }
         }
         if(_palette)
         {
            for each(_loc2_ in _palette)
            {
               _loc2_.dispose();
            }
         }
         _data = null;
         _palette = null;
         var_688 = -1;
         var_62 = null;
         _selectedColorLayerIndex = -1;
      }
      
      public function getCurrentColor(param1:int) : AvatarEditorGridColorItem
      {
         var _loc2_:int = 0;
         if(param1 > -1)
         {
            _loc2_ = param1;
         }
         else
         {
            _loc2_ = _selectedColorLayerIndex;
         }
         if(var_62.length <= _loc2_)
         {
            return null;
         }
         if(true)
         {
            return null;
         }
         return _palette["null"] as AvatarEditorGridColorItem;
      }
      
      public function selectItemIndex(param1:int) : AvatarEditorGridPartItem
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_data)
         {
            return null;
         }
         if(var_688 >= 0 && _data.length > var_688)
         {
            _loc3_ = _data[var_688];
            _loc3_.isSelected = false;
         }
         if(_data.length > param1)
         {
            _loc2_ = _data[param1] as AvatarEditorGridPartItem;
            _loc2_.isSelected = true;
         }
         var_688 = param1;
         return _loc2_;
      }
      
      public function selectColorLayerIndex(param1:int) : void
      {
         if(!var_62)
         {
            var_62 = new Array();
         }
         _selectedColorLayerIndex = param1;
         while(var_62.length <= param1)
         {
            var_62.push(-1);
         }
         selectColorIndex(var_62[_selectedColorLayerIndex]);
      }
      
      public function selectColorIds(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         if(!_palette)
         {
            return;
         }
         if(!param1)
         {
            return;
         }
         var_62 = new Array(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = 0;
            while(_loc4_ < _palette.length)
            {
               _loc2_ = _palette[_loc4_] as AvatarEditorGridColorItem;
               if(_loc2_.partColor.id == param1[_loc3_])
               {
                  var_62[_loc3_] = _loc4_;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         _selectedColorLayerIndex = Math.min(_selectedColorLayerIndex,-1);
         selectColorIndex(var_62[_selectedColorLayerIndex]);
      }
      
      public function stripClubColorsOverLevel(param1:int) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:Array = new Array();
         var _loc3_:Array = getCurrentColors();
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc5_];
            if(_loc6_.clubLevel > param1)
            {
               _loc7_ = _palette[0] as AvatarEditorGridColorItem;
               if(_loc7_ && _loc7_.partColor)
               {
                  _loc2_.push(_loc7_.partColor.id);
               }
               else
               {
                  _loc2_.push(0);
               }
               _loc4_ = true;
            }
            else
            {
               _loc2_.push(_loc6_.id);
            }
            _loc5_++;
         }
         if(_loc4_)
         {
            selectColorIds(_loc2_);
         }
         return _loc4_;
      }
      
      private function clearAllColorSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in _palette)
         {
            if(_loc1_ && _loc1_.isSelected)
            {
               _loc1_.isSelected = false;
            }
         }
      }
      
      public function getCurrentColorIds() : Array
      {
         var _loc4_:* = null;
         if(!var_62)
         {
            return null;
         }
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < var_62.length)
         {
            if(false)
            {
               _loc4_ = _palette["null"] as AvatarEditorGridColorItem;
               if(_loc4_ && _loc4_.partColor)
               {
                  _loc1_.push(_loc4_.partColor.id);
               }
               else
               {
                  _loc1_.push(-1);
               }
            }
            else
            {
               _loc1_.push(-1);
            }
            _loc2_++;
         }
         var _loc3_:AvatarEditorGridPartItem = getCurrentPart();
         if(!_loc3_)
         {
            return null;
         }
         return _loc1_.slice(0,Math.max(_loc3_.colorLayerCount,1));
      }
      
      public function get data() : Array
      {
         return _data;
      }
      
      public function get palette() : Array
      {
         return _palette;
      }
      
      public function stripClubItemsOverLevel(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:AvatarEditorGridPartItem = getCurrentPart();
         if(_loc2_ && _loc2_.partSet)
         {
            _loc3_ = _loc2_.partSet;
            if(_loc3_.clubLevel > param1)
            {
               _loc4_ = selectItemIndex(0);
               if(_loc4_ && _loc4_.partSet == null)
               {
                  selectItemIndex(1);
               }
               return true;
            }
         }
         return false;
      }
   }
}
