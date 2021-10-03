package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_346:Number = 0.5;
      
      private static const const_768:int = 3;
      
      private static const const_1077:Number = 1;
       
      
      private var var_1983:Boolean = false;
      
      private var var_1985:Boolean = false;
      
      private var var_1028:int = 0;
      
      private var var_264:Vector3d = null;
      
      private var var_1982:int = 0;
      
      private var var_1981:int = 0;
      
      private var var_1980:Boolean = false;
      
      private var var_1978:int = -2;
      
      private var var_1979:Boolean = false;
      
      private var var_1976:int = 0;
      
      private var var_1984:int = -1;
      
      private var var_401:Vector3d = null;
      
      private var var_1977:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1982;
      }
      
      public function get targetId() : int
      {
         return var_1984;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1976 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1982 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1983 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1984 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1985 = param1;
      }
      
      public function dispose() : void
      {
         var_401 = null;
         var_264 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_401 == null)
         {
            var_401 = new Vector3d();
         }
         var_401.assign(param1);
         var_1028 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1978;
      }
      
      public function get screenHt() : int
      {
         return var_1977;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1981 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_264;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1977 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1976;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1983;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1985;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_401 != null && var_264 != null)
         {
            ++var_1028;
            _loc2_ = Vector3d.dif(var_401,var_264);
            if(_loc2_.length <= const_346)
            {
               var_264 = var_401;
               var_401 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_346 * (const_768 + 1))
               {
                  _loc2_.mul(const_346);
               }
               else if(var_1028 <= const_768)
               {
                  _loc2_.mul(const_346);
               }
               else
               {
                  _loc2_.mul(const_1077);
               }
               var_264 = Vector3d.sum(var_264,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1980 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1981;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1979 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1978 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_264 != null)
         {
            return;
         }
         var_264 = new Vector3d();
         var_264.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1980;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1979;
      }
   }
}
