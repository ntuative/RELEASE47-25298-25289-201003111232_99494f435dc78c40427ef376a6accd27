package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   
   public interface IAvatarImage extends IDisposable
   {
       
      
      function get petType() : int;
      
      function getPartColor(param1:String) : IPartColor;
      
      function isAnimating() : Boolean;
      
      function getSubType() : int;
      
      function getImage(param1:String) : BitmapData;
      
      function getMainAction() : IActiveActionData;
      
      function setScale(param1:String) : void;
      
      function getDirection() : int;
      
      function get avatarSpriteData() : IAvatarDataContainer;
      
      function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData;
      
      function endActionAppends() : void;
      
      function get petRace() : int;
      
      function getCroppedImage(param1:String) : BitmapData;
      
      function initActionAppends() : void;
      
      function getScale() : String;
      
      function setDirectionAngle(param1:String, param2:int) : void;
      
      function appendAction(param1:String, ... rest) : Boolean;
      
      function getSprites() : Array;
      
      function getCanvasOffsets() : Array;
      
      function getAsset(param1:String) : BitmapDataAsset;
      
      function updateAnimation(param1:Number) : void;
      
      function setDirection(param1:String, param2:int) : void;
      
      function updateAnimationByFrames(param1:int = 1) : void;
   }
}
