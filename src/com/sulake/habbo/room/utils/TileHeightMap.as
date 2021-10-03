package com.sulake.habbo.room.utils
{
   public class TileHeightMap
   {
       
      
      private var var_131:int = 0;
      
      private var var_132:int = 0;
      
      private var _heightData:Array;
      
      private var var_842:Array;
      
      private var var_695:Array;
      
      public function TileHeightMap(param1:int, param2:int)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         _heightData = [];
         var_695 = [];
         var_842 = [];
         super();
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = [];
            _loc5_ = [];
            _loc6_ = [];
            _loc7_ = 0;
            while(_loc7_ < param1)
            {
               _loc4_.push(0);
               _loc5_.push(false);
               _loc6_.push(false);
               _loc7_++;
            }
            _heightData.push(_loc4_);
            var_695.push(_loc5_);
            var_842.push(_loc6_);
            _loc3_++;
         }
         var_131 = param1;
         var_132 = param2;
      }
      
      public function isRoomTile(param1:int, param2:int) : Boolean
      {
         var _loc3_:* = null;
         if(param1 >= 0 && param1 < var_131 && param2 >= 0 && param2 < var_132)
         {
            _loc3_ = var_842[param2] as Array;
            return Boolean(_loc3_[param1]);
         }
         return true;
      }
      
      public function get mapHeight() : int
      {
         return var_132;
      }
      
      public function setTileBlocking(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:* = null;
         if(param1 >= 0 && param1 < var_131 && param2 >= 0 && param2 < var_132)
         {
            _loc4_ = var_695[param2] as Array;
            _loc4_[param1] = param3;
         }
      }
      
      public function get mapWidth() : int
      {
         return var_131;
      }
      
      public function validateLocation(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc13_:Boolean = false;
         var _loc14_:Number = NaN;
         if(param1 < 0 || param1 >= var_131 || param2 < 0 || param2 >= var_132)
         {
            return false;
         }
         if(param3 > var_131)
         {
            return false;
         }
         if(param4 > var_132)
         {
            return false;
         }
         if(param1 + param3 > var_131 || param2 + param4 > var_132)
         {
            return false;
         }
         if(param5 < 0 || param5 >= var_131)
         {
            param5 = 0;
         }
         if(param6 < 0 || param6 >= var_132)
         {
            param6 = 0;
         }
         if(param7 > var_131)
         {
            param7 = var_131;
         }
         if(param8 > var_132)
         {
            param8 = var_132;
         }
         if(param5 + param7 >= var_131)
         {
            param7 = var_131 - param5;
         }
         if(param6 + param8 >= var_132)
         {
            param8 = var_132 - param6;
         }
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         _loc10_ = param2;
         while(_loc10_ < param2 + param4)
         {
            _loc11_ = var_695[_loc10_] as Array;
            _loc9_ = param1;
            while(_loc9_ < param1 + param3)
            {
               if(_loc9_ < param5 || _loc9_ >= param5 + param7 || _loc10_ < param6 || _loc10_ >= param6 + param8)
               {
                  _loc13_ = Boolean(_loc11_[_loc9_]);
                  if(_loc13_)
                  {
                     return false;
                  }
               }
               _loc9_++;
            }
            _loc10_++;
         }
         _loc11_ = _heightData[param2] as Array;
         var _loc12_:Number = Number(_loc11_[param1]);
         _loc10_ = param2;
         while(_loc10_ < param2 + param4)
         {
            _loc11_ = _heightData[_loc10_] as Array;
            _loc9_ = param1;
            while(_loc9_ < param1 + param3)
            {
               if(_loc9_ < param5 || _loc9_ >= param5 + param7 || _loc10_ < param6 || _loc10_ >= param6 + param8)
               {
                  _loc14_ = Number(_loc11_[_loc9_]);
                  if(_loc14_ > _loc12_)
                  {
                     return false;
                  }
               }
               _loc9_++;
            }
            _loc10_++;
         }
         return true;
      }
      
      public function getTileBlocking(param1:int, param2:int) : Boolean
      {
         var _loc3_:* = null;
         if(param1 >= 0 && param1 < var_131 && param2 >= 0 && param2 < var_132)
         {
            _loc3_ = var_695[param2] as Array;
            return Boolean(_loc3_[param1]);
         }
         return true;
      }
      
      public function setIsRoomTile(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:* = null;
         if(param1 >= 0 && param1 < var_131 && param2 >= 0 && param2 < var_132)
         {
            _loc4_ = var_842[param2] as Array;
            _loc4_[param1] = param3;
            if(!param3)
            {
               setTileBlocking(param1,param2,true);
            }
         }
      }
      
      public function setTileHeight(param1:int, param2:int, param3:Number) : void
      {
         var _loc4_:* = null;
         if(param1 >= 0 && param1 < var_131 && param2 >= 0 && param2 < var_132)
         {
            _loc4_ = _heightData[param2] as Array;
            _loc4_[param1] = param3;
         }
      }
      
      public function getTileHeight(param1:int, param2:int) : Number
      {
         var _loc3_:* = null;
         if(param1 >= 0 && param1 < var_131 && param2 >= 0 && param2 < var_132)
         {
            _loc3_ = _heightData[param2] as Array;
            return Number(_loc3_[param1]);
         }
         return 0;
      }
      
      public function dispose() : void
      {
         _heightData = [];
         var_695 = [];
         var_842 = [];
         var_131 = 0;
         var_132 = 0;
      }
   }
}
