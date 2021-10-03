package com.sulake.habbo.avatar.pets
{
   public interface IBreed
   {
       
      
      function get patternId() : int;
      
      function get id() : int;
      
      function get localizationKey() : String;
      
      function get avatarFigureString() : String;
   }
}
