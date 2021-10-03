package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1082:SoundChannel = null;
      
      private var var_917:Boolean;
      
      private var var_1081:Sound = null;
      
      private var var_729:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1081 = param1;
         var_1081.addEventListener(Event.COMPLETE,onComplete);
         var_729 = 1;
         var_917 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_917;
      }
      
      public function stop() : Boolean
      {
         var_1082.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_917 = false;
         var_1082 = var_1081.play(0);
         this.volume = var_729;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_729;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1082.position;
      }
      
      public function get length() : Number
      {
         return var_1081.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_729 = param1;
         if(var_1082 != null)
         {
            var_1082.soundTransform = new SoundTransform(var_729);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_917 = true;
      }
   }
}
