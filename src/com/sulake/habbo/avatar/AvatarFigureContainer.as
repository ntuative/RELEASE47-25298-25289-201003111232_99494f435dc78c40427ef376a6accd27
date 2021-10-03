package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   
   public class AvatarFigureContainer
   {
       
      
      private var var_583:Map;
      
      public function AvatarFigureContainer(param1:String)
      {
         super();
         var_583 = new Map();
         parseFigureString(param1);
      }
      
      public function getPartSetId(param1:String) : int
      {
         var _loc2_:Map = getParts().getValue(param1) as Map;
         if(_loc2_ != null)
         {
            return _loc2_.getValue("setid") as int;
         }
         return 0;
      }
      
      public function getPartTypeIds() : Array
      {
         return getParts().getKeys();
      }
      
      public function removePart(param1:String) : void
      {
         getParts().remove(param1);
      }
      
      public function hasPartType(param1:String) : Boolean
      {
         return getParts().getValue(param1) != null;
      }
      
      private function parseFigureString(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         for each(_loc2_ in param1.split("."))
         {
            _loc3_ = _loc2_.split("-");
            if(_loc3_.length >= 2)
            {
               _loc4_ = String(_loc3_[0]);
               _loc5_ = parseInt(_loc3_[1]);
               _loc6_ = new Array();
               _loc7_ = 2;
               while(_loc7_ < _loc3_.length)
               {
                  _loc6_.push(parseInt(_loc3_[_loc7_]));
                  _loc7_++;
               }
               updatePart(_loc4_,_loc5_,_loc6_);
            }
         }
      }
      
      private function getParts() : Map
      {
         if(var_583 == null)
         {
            var_583 = new Map();
         }
         return var_583;
      }
      
      public function updatePart(param1:String, param2:int, param3:Array) : void
      {
         var _loc4_:Map = new Map();
         _loc4_.add("type",param1);
         _loc4_.add("setid",param2);
         _loc4_.add("colorids",param3);
         var _loc5_:Map = getParts();
         _loc5_.remove(param1);
         _loc5_.add(param1,_loc4_);
      }
      
      public function getPartColorIds(param1:String) : Array
      {
         var _loc2_:Map = getParts().getValue(param1) as Map;
         if(_loc2_ != null)
         {
            return _loc2_.getValue("colorids") as Array;
         }
         return null;
      }
   }
}
