package com.sulake.core.window.utils
{
   import flash.events.FocusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   
   public class KeyboardEventQueue extends GenericEventQueue
   {
       
      
      public function KeyboardEventQueue(param1:IEventDispatcher)
      {
         super(param1);
         _eventDispatcher.addEventListener(KeyboardEvent.KEY_DOWN,keyEventListener,false);
         _eventDispatcher.addEventListener(KeyboardEvent.KEY_UP,keyEventListener,false);
         _eventDispatcher.addEventListener(FocusEvent.FOCUS_IN,focusEventListener,false);
         _eventDispatcher.addEventListener(FocusEvent.FOCUS_OUT,focusEventListener,false);
         _eventDispatcher.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,focusEventListener,false);
         _eventDispatcher.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,focusEventListener,false);
      }
      
      private function keyEventListener(param1:KeyboardEvent) : void
      {
         var_285.push(param1);
      }
      
      private function focusEventListener(param1:FocusEvent) : void
      {
         var_285.push(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            _eventDispatcher.removeEventListener(KeyboardEvent.KEY_DOWN,keyEventListener,false);
            _eventDispatcher.removeEventListener(KeyboardEvent.KEY_UP,keyEventListener,false);
            _eventDispatcher.removeEventListener(FocusEvent.FOCUS_IN,focusEventListener,false);
            _eventDispatcher.removeEventListener(FocusEvent.FOCUS_OUT,focusEventListener,false);
            _eventDispatcher.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,focusEventListener,false);
            _eventDispatcher.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,focusEventListener,false);
            super.dispose();
         }
      }
   }
}
