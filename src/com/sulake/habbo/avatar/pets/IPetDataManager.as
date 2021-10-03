package com.sulake.habbo.avatar.pets
{
   import com.sulake.core.utils.Map;
   
   public interface IPetDataManager
   {
       
      
      function getPetData(param1:int) : IPetData;
      
      function get species() : Map;
   }
}
