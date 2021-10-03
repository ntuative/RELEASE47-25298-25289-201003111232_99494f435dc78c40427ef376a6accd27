package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.Palette;
   import com.sulake.habbo.avatar.structure.figure.SetType;
   import flash.utils.Dictionary;
   
   public class FigureData implements IStructureData, IFigureData
   {
       
      
      private var var_1053:Dictionary;
      
      private var var_1052:Dictionary;
      
      public function FigureData()
      {
         super();
         var_1052 = new Dictionary();
         var_1053 = new Dictionary();
      }
      
      public function getPalette(param1:int) : IPalette
      {
         return var_1052[String(param1)];
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            var_1052[String(_loc2_.@id)] = new Palette(_loc2_);
         }
         for each(_loc3_ in param1.sets.settype)
         {
            var_1053[String(_loc3_.@type)] = new SetType(_loc3_);
         }
         return true;
      }
      
      public function getSetType(param1:String) : ISetType
      {
         return var_1053[param1];
      }
      
      public function append(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors.palette)
         {
            _loc4_ = var_1052[String(_loc2_.@id)];
            if(_loc4_ == null)
            {
               var_1052[String(_loc2_.@id)] = new Palette(_loc2_);
            }
            else
            {
               _loc4_.append(_loc2_);
            }
         }
         for each(_loc3_ in param1.sets.settype)
         {
            _loc5_ = var_1053[String(_loc3_.@type)];
            if(_loc5_ == null)
            {
               var_1053[String(_loc3_.@type)] = new SetType(_loc3_);
            }
            else
            {
               _loc5_.append(_loc3_);
            }
         }
         return false;
      }
      
      public function dispose() : void
      {
      }
   }
}
