package com.sulake.core.window.utils
{
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventQueue extends GenericEventQueue
   {
       
      
      protected var var_1375:Point;
      
      public function MouseEventQueue(param1:IEventDispatcher)
      {
         super(param1);
         var_1375 = new Point();
         _eventDispatcher.addEventListener(MouseEvent.CLICK,mouseEventListener,false);
         _eventDispatcher.addEventListener(MouseEvent.DOUBLE_CLICK,mouseEventListener,false);
         _eventDispatcher.addEventListener(MouseEvent.MOUSE_DOWN,mouseEventListener,false);
         _eventDispatcher.addEventListener(MouseEvent.MOUSE_MOVE,mouseEventListener,false);
         _eventDispatcher.addEventListener(MouseEvent.MOUSE_UP,mouseEventListener,false);
         _eventDispatcher.addEventListener(MouseEvent.MOUSE_WHEEL,mouseEventListener,false);
      }
      
      public function get mousePosition() : Point
      {
         return var_1375;
      }
      
      private function mouseEventListener(param1:MouseEvent) : void
      {
         var_1375.x = param1.stageX;
         var_1375.y = param1.stageY;
         var_285.push(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            _eventDispatcher.removeEventListener(MouseEvent.CLICK,mouseEventListener,false);
            _eventDispatcher.removeEventListener(MouseEvent.DOUBLE_CLICK,mouseEventListener,false);
            _eventDispatcher.removeEventListener(MouseEvent.MOUSE_DOWN,mouseEventListener,false);
            _eventDispatcher.removeEventListener(MouseEvent.MOUSE_MOVE,mouseEventListener,false);
            _eventDispatcher.removeEventListener(MouseEvent.MOUSE_UP,mouseEventListener,false);
            _eventDispatcher.removeEventListener(MouseEvent.MOUSE_WHEEL,mouseEventListener,false);
            super.dispose();
         }
      }
   }
}
