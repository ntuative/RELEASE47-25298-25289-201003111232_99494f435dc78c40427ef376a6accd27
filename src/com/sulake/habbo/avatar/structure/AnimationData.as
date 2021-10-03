package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.animation.AnimationAction;
   import flash.utils.Dictionary;
   
   public class AnimationData implements IStructureData
   {
       
      
      private var var_188:Dictionary;
      
      public function AnimationData()
      {
         super();
         var_188 = new Dictionary();
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.action)
         {
            var_188[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
      
      public function getAction(param1:IActionDefinition) : AnimationAction
      {
         return var_188[param1.assetPartDefinition];
      }
      
      public function append(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.action)
         {
            var_188[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
   }
}
